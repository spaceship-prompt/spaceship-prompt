#
# Ansible
#
# Ansible is a suite of software tools that enables infrastructure as code.
# Link: https://docs.ansible.com/ansible/latest/index.html

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ANSIBLE_SHOW="${SPACESHIP_ANSIBLE_SHOW=true}"
SPACESHIP_ANSIBLE_ASYNC="${SPACESHIP_ANSIBLE_ASYNC=true}"
SPACESHIP_ANSIBLE_PREFIX="${SPACESHIP_ANSIBLE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_ANSIBLE_SUFFIX="${SPACESHIP_ANSIBLE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ANSIBLE_SYMBOL="${SPACESHIP_ANSIBLE_SYMBOL="🅐 "}"
SPACESHIP_ANSIBLE_COLOR="${SPACESHIP_ANSIBLE_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_ansible() {
  [[ $SPACESHIP_ANSIBLE_SHOW == false ]] && return

  # Check if ansible is installed
  spaceship::exists ansible || return

  # Show ansible section only when there are ansible-specific files in current
  # working directory.
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # https://zsh.sourceforge.net/Doc/Release/Expansion.html
  local ansible_configs="$(spaceship::upsearch ansible.cfg .ansible.cfg)"
  local yaml_files="$(echo ?(*.yml|*.yaml)([1]N^/))"
  local detected_playbooks

  if [[ -n "$yaml_files" ]]; then
    detected_playbooks="$(command awk '
      { line = $0; sub(/\r$/, "", line) }
      # Skip blank lines, comments, document markers and directives
      line ~ /^[ \t]*(#|$)/ || line ~ /^(---|\.\.\.|%)/ { next }
      { body = line; sub(/^ +/, "", body); ind = length(line) - length(body) }
      # The document root must be a sequence
      !seen { seen = 1; if (line !~ /^-([ \t]|$)/) exit }
      # Top-level sequence item: a new play
      line ~ /^-([ \t]|$)/ {
        rest = substr(line, 2); sub(/^[ \t]+/, "", rest)
        play = 0; pending = 0
        if (rest == "") { pending = 1; next }
        if (rest ~ /^[A-Za-z_][A-Za-z0-9_]*:([ \t]|$)/) {
          play = length(line) - length(rest)
          if (rest ~ /^(hosts|tasks|roles):/) { print; exit }
        }
        next
      }
      # Any other line at column 0 ends the current play
      ind == 0 { play = 0; pending = 0; next }
      # A lone "-": the play keys start on the next line
      pending { pending = 0; play = ind }
      # A key that belongs directly to the current play
      play && ind == play && body ~ /^(hosts|tasks|roles):/ { print; exit }
    ' $yaml_files)"
  fi

  if [[ -n "$ansible_configs" ]] && [[ "$ansible_configs" == "$HOME/.ansible.cfg" || "$ansible_configs" == "$HOME/ansible.cfg" ]]; then
    unset ansible_configs
  fi

  [[ -n "$ansible_configs" || -n "$detected_playbooks" ]] || return

  # Retrieve ansible version
  local ansible_version=$(ansible --version | head -1 | spaceship::grep -oE '([0-9]+\.)([0-9]+\.)?([0-9]+)')

  # Display ansible section
  spaceship::section \
    --color "$SPACESHIP_ANSIBLE_COLOR" \
    --prefix "$SPACESHIP_ANSIBLE_PREFIX" \
    --suffix "$SPACESHIP_ANSIBLE_SUFFIX" \
    --symbol "$SPACESHIP_ANSIBLE_SYMBOL" \
    "v$ansible_version"
}
