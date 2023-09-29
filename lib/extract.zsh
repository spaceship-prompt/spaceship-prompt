#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
# EXTRACT
# Utils for extracting data from files
# ------------------------------------------------------------------------------

spaceship::extract::python() {
  local imports=$1 load=$2; shift 2
  local keys=("$@")
  python -c "import $imports, functools; data=$load; print(next(filter(None, map(lambda key: functools.reduce(lambda obj, key: obj[key] if key in obj else {}, key.split('.'), data), ['${(j|','|)keys}'])), None))" 2>/dev/null
}

spaceship::extract::python::yaml() {
  local file=$1; shift
  spaceship::extract::python yaml "yaml.safe_load(open('$file'))" "$@"
}

spaceship::extract::python::json() {
  local file=$1; shift
  spaceship::extract::python json "json.load(open('$file'))" "$@"
}

spaceship::extract::python::toml() {
  local file=$1; shift
  local import py_version="${(@)$(python3 -V 2>&1)[2]}"
  autoload is-at-least
  # Python 3.11 added tomllib in the stdlib.
  # Previous versions require the tomli package
  if is-at-least 3.11 "$py_version" ]]; then
    import=tomllib
  else
    import=tomli
  fi
  spaceship::extract::python "$import" "$import.load(open('$file', 'rb'))" "$@"
}

spaceship::extract::jq() {
  local exe=$1 file=$2; shift 2
  local keys=("$@")
  "$exe" -r ".${(j| // .|)keys}" "$file" 2>/dev/null
}

spaceship::extract::ruby() {
  local import=$1 load=$2; shift 2
  local keys=("$@")
  ruby -r "$import" -e "puts ['${(j|','|)keys}'].map { |key| key.split('.').reduce($load) { |obj, key| obj[key] } }.find(&:itself)" 2>/dev/null
}

spaceship::extract::ruby::yaml() {
  local file=$1; shift
  spaceship::extract::ruby 'yaml' "YAML::load_file('$file')" "$@"
}

spaceship::extract::ruby::json() {
  local file=$1; shift
  spaceship::extract::ruby 'json' "JSON::load(File.read('$file'))" "$@"
}

spaceship::extract::node::json() {
  local file=$1; shift
  local keys=("$@")
  node -p "['${(j|','|)keys}'].map(s => s.split('.').reduce((obj, key) => obj[key], require('./$file'))).find(Boolean)" 2>/dev/null
}

# Read data file with dot notation (JSON, YAML, TOML, XML). Additional keys
# will be used as alternatives.
# USAGE:
#   spaceship::extract --<type> <file> [...keys]
# EXAMPLE:
#  $ spaceship::extract --json package.json "author.name"
#  > "John Doe"
#  $ spaceship::extract --toml pyproject.toml "project.version" "tool.poetry.version"
spaceship::extract() {
  # Parse CLI options
  zparseopts -E -D \
    -json=json \
    -yaml=yaml \
    -toml=toml \
    -xml=xml

  local file="$1"; shift

  if [[ -n "$yaml" ]]; then
    if spaceship::exists yq; then
      spaceship::extract::jq yq "$file" "$@"
    elif spaceship::exists ruby; then
      spaceship::extract::ruby::yaml "$file" "$@"
    elif spaceship::exists python3; then
      spaceship::extract::python::yaml "$file" "$@"
    else
      return 1
    fi
  fi

  if [[ -n "$json" ]]; then
    if spaceship::exists jq; then
      spaceship::extract::jq jq "$file" "$@"
    elif spaceship::exists yq; then
      spaceship::extract::jq yq "$file" "$@"
    elif spaceship::exists ruby; then
      spaceship::extract::ruby::json "$file" "$@"
    elif spaceship::exists python3; then
      spaceship::extract::python::json "$file" "$@"
    elif spaceship::exists node; then
      spaceship::extract::node::json "$file" "$@"
    else
      return 1
    fi
  fi

  if [[ -n "$toml" ]]; then
    if spaceship::exists tomlq; then
      spaceship::extract::jq tomlq "$file" "$@"
    elif spaceship::exists python3; then
      spaceship::extract::python::toml "$file" "$@"
    else
      return 1
    fi
  fi

  if [[ -n "$xml" ]]; then
    if spaceship::exists xq; then
      spaceship::extract::jq xq "$file" "$@"
    else
      return 1
    fi
  fi

  # todo: grep by regexp?
  return 1
}

# Alias for backward compatibility
spaceship::datafile() {
  spaceship::extract "$@"
}
