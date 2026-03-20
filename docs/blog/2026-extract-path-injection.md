# Fixing path-based interpreter injection in Spaceship

<aside class="mdx-author" markdown>
  ![@denysdovhan](https://unavatar.io/denysdovhan)

  <span>__Denys Dovhan__ · @denysdovhan</span>
  <span>
  :octicons-calendar-24: Mar 20, 2026 ·
  :octicons-shield-lock-24: Security update
  </span>
</aside>

---

We shipped a security hardening update for `spaceship::extract`, the helper that reads
JSON, YAML, and TOML files for sections such as `package`.

The reported issue was simple and dangerous: Spaceship discovered a file path with
`upsearch`, then interpolated that path directly into inline Python, Ruby, or Node
source passed through `-c`, `-e`, or `-p`. A malicious directory name containing a
single quote could break out of the string literal and execute arbitrary code during
prompt rendering.

That meant a victim did not need to run a script from the repository. In the vulnerable
paths, a passive `cd` into a directory containing `package.json`, `pubspec.yaml`, or
similar project files was enough to trigger the bug.

## The vulnerable pattern

Before the fix, several extractor helpers embedded the file path directly into the
interpreter source string:

```zsh title="lib/extract.zsh"
spaceship::extract::python json "json.load(open('$file'))" "$@"
spaceship::extract::ruby 'json' "JSON::load(File.read('$file'))" "$@"
node -p "['${(j|','|)keys}'].map(s => s.split('.').reduce((obj, key) => obj[key], require('./$file'))).find(Boolean)"
```

That approach is safe only if the path is fully trusted and already escaped for the
target interpreter. Here it was neither.

## Example trigger

The reported proof of concept used a directory name like this:

```text
foo'+`id>PWNED`+'
```

With a `package.json` inside that directory, the Ruby JSON path could evaluate into a
command like this:

```ruby
JSON::load(File.read('/tmp/project/foo'+`id>PWNED`+'/package.json'))
```

The shell command inside the Ruby backticks runs while Ruby evaluates the argument.
`File.read` still fails afterward, but the command already executed.

In practice, this could happen through the `package` section:

```zsh
local package_json=$(spaceship::upsearch package.json) || return
local package_version="$(spaceship::extract --json "$package_json" version)"
```

If `jq` or `yq` were not selected first, Spaceship could fall back to Ruby, Python, or
Node and hit the vulnerable code path.

## The fix

The mitigation is to keep the file path out of interpreter source strings entirely.
Instead of interpolating `$file`, Spaceship now passes the path as a positional
argument and reads it from argv inside the interpreter:

```zsh title="lib/extract.zsh"
spaceship::extract::python json "json.load(open(sys.argv[1]))" "$file" "$@"
spaceship::extract::ruby 'json' "JSON::load(File.read(ARGV[0]))" "$file" "$@"
node -p "['${(j|','|)keys}'].map(s => s.split('.').reduce((obj, key) => obj[key], require(require('path').resolve(process.argv[1])))).find(Boolean)" -- "$file" 2>/dev/null
```

This makes the filename data, not code.

The patch also hardens the Ruby YAML path:

```zsh
spaceship::extract::ruby 'yaml' "YAML.safe_load(File.read(ARGV[0]))" "$file" "$@"
```

That replaces `YAML::load_file(...)`, which can deserialize arbitrary Ruby objects on
older Ruby/Psych combinations.

Finally, the `package` section now quotes the file path when it calls
`spaceship::extract`, which avoids zsh splitting paths that contain spaces before they
ever reach the hardened extractor.

## What this changes for users

No configuration changes are required.

Users get:

* safer prompt rendering when visiting untrusted repositories or directories;
* better handling for unusual path names in the `package` section; and
* safer YAML parsing on the Ruby fallback path.

## Regression coverage

We added focused tests for the extractor helpers and the `package` section:

* interpreter helpers now verify that the discovered file path is passed via argv and
  never embedded back into the interpreter source string;
* the Ruby YAML path is checked for `YAML.safe_load`; and
* the package section is covered with a path containing spaces, quotes, and backticks to
  ensure the quoted call sites remain intact.

Security fixes are most useful when they stay fixed. This change set keeps the
interpreter boundary explicit and adds tests around the exact data flow that was
previously exploitable.
