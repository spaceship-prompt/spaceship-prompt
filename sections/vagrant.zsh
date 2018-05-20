#
# Vagrant
#
# Vagrant enables users to create and configure lightweight, reproducible, and portable development environments.
# Link: https://www.vagrantup.com

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_VAGRANT_SHOW="${SPACESHIP_VAGRANT_SHOW=true}"
SPACESHIP_VAGRANT_PREFIX="${SPACESHIP_VAGRANT_PREFIX="on "}"
SPACESHIP_VAGRANT_SUFFIX="${SPACESHIP_VAGRANT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_VAGRANT_SYMBOL="${SPACESHIP_VAGRANT_SYMBOL="Ｖ"}"
SPACESHIP_VAGRANT_COLOR="${SPACESHIP_VAGRANT_COLOR="39"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current Vagrant status
spaceship_vagrant() {
  [[ $SPACESHIP_VAGRANT_SHOW == false ]] && return

  spaceship::exists vagrant || return

  # Show Vagrant status only for Vagrant-specific folders
  [[ -f Vagrantfile || (-n $VAGRANT_VAGRANTFILE && -f ${VAGRANT_VAGRANTFILE}) ]] || return

  # local vagrant_status=$(cat .vagrant/machines/*/virtualbox/id | xargs VboxManage showvminfo | grep State | awk {'print $2'})

  local vagrant_status=$(cat ${HOME}/.vagrant.d/data/machine-index/index | python -c 'import sys, os, json;
json_file = json.load(sys.stdin)["machines"]
for box in f:
  if (json_file[box["vagrantfile_path"] == os.getcwd()):
    print (json_file[box]["state"])
    break;
')

  spaceship::section \
    "$SPACESHIP_VAGRANT_COLOR" \
    "$SPACESHIP_VAGRANT_PREFIX" \
    "${SPACESHIP_VAGRANT_SYMBOL}${vagrant_status}" \
    "$SPACESHIP_VAGRANT_SUFFIX"
}
