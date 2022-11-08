#
# Ansible
#
# Ansible is an IT automation tool.
# Link: https://docs.ansible.com/ansible/latest/index.html

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ANSIBLE_SHOW="${SPACESHIP_ANSIBLE_SHOW=true}"
SPACESHIP_ANSIBLE_ASYNC="${SPACESHIP_ANSIBLE_ASYNC=true}"
SPACESHIP_ANSIBLE_SHOW_VERSION="${SPACESHIP_ANSIBLE_SHOW_VERSION=false}"
SPACESHIP_ANSIBLE_PREFIX="${SPACESHIP_ANSIBLE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_ANSIBLE_SUFFIX="${SPACESHIP_ANSIBLE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ANSIBLE_SYMBOL="${SPACESHIP_ANSIBLE_SYMBOL="🅐 "}"
SPACESHIP_ANSIBLE_COLOR="${SPACESHIP_ANSIBLE_COLOR="white"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_ansible() {
  [[ $SPACESHIP_ANSIBLE_SHOW == false ]] && return

  # Show ansible section only when there are ansible-specific files in current
  # working directory.
  # Here glob qualifiers are used to check if files with specific extension are
  # present in directory. Read more about them here:
  # https://zsh.sourceforge.net/Doc/Release/Expansion.html
  local yaml_files="$(echo ?(*.yml|*.yaml)([1]N^/))"
  local detected_playbooks="$(spaceship::grep -m 1 -E "tasks|hosts|roles" $yaml_files 2> /dev/null)"
  local ansible_configs="$(spaceship::upsearch ansible.cfg .ansible.cfg)"

  [[ -n "$ansible_configs" || -n "$detected_playbooks" ]] || return

  # Retrieve ansible version
  local ansible_version=$(ansible --version | head -1 | spaceship::grep -oE '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]')

  # Display ansible section
  spaceship::section \
    --color "$SPACESHIP_ANSIBLE_COLOR" \
    --prefix "$SPACESHIP_ANSIBLE_PREFIX" \
    --suffix "$SPACESHIP_ANSIBLE_SUFFIX" \
    --symbol "$SPACESHIP_ANSIBLE_SYMBOL" \
    "$ansible_version"
}
