#
# Battery
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# | SPACESHIP_BATTERY_SHOW | below threshold | above threshold | fully charged |
# |------------------------+-----------------+-----------------+---------------|
# | false                  | hidden          | hidden          | hidden        |
# | always                 | shown           | shown           | shown         |
# | true                   | shown           | hidden          | hidden        |
# | charged                | shown           | hidden          | shown         |
# ------------------------------------------------------------------------------

SPACESHIP_BATTERY_SHOW="${SPACESHIP_BATTERY_SHOW=true}"
SPACESHIP_BATTERY_PREFIX="${SPACESHIP_BATTERY_PREFIX=""}"
SPACESHIP_BATTERY_SUFFIX="${SPACESHIP_BATTERY_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_BATTERY_SYMBOL_CHARGING="${SPACESHIP_BATTERY_SYMBOL_CHARGING="⇡"}"
SPACESHIP_BATTERY_SYMBOL_DISCHARGING="${SPACESHIP_BATTERY_SYMBOL_DISCHARGING="⇣"}"
SPACESHIP_BATTERY_SYMBOL_FULL="${SPACESHIP_BATTERY_SYMBOL_FULL="•"}"
SPACESHIP_BATTERY_THRESHOLD="${SPACESHIP_BATTERY_THRESHOLD=10}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show section only if either of follow is true
# - Always show is true
# - battery percentage is below the given limit (default: 10%)
# - Battery is fully charged
# Escape % for display since it's a special character in zsh prompt expansion
spaceship_battery() {
  [[ $SPACESHIP_BATTERY_SHOW == false ]] && return

  local battery_data battery_percent battery_status battery_color

  if spaceship::exists pmset; then
    battery_data=$( command pmset -g batt )

    # Return if no internal battery
    [[ -z $( command echo $battery_data | command grep "InternalBattery" ) ]] && return

    battery_percent="$( command echo $battery_data | command grep -oE '[0-9]{1,3}%' )"
    battery_status="$( command echo $battery_data | command awk -F '; *' 'NR==2 { print $2 }' )"
  elif spaceship::exists upower; then
    local battery=$( command upower -e | command grep battery | command head -1 )

    # Return if no battery
    [[ -z $battery ]] && return

    battery_data=$( command upower -i $battery )
    battery_percent="$( command echo "$battery_data" | command grep percentage | command awk '{print $2}' )"
    battery_status="$( command echo "$battery_data" | command grep state | command awk '{print $2}' )"
  elif spaceship::exists acpi; then
    battery_data=$( command acpi -b )

    # Return if no battery
    [[ -z $battery_data ]] && return

    battery_percent="$( command echo $battery_data | command awk '{print $4}' )"
    battery_status="$( command echo $battery_data | command awk '{print tolower($3)}' )"
  else
    return
  fi

  # Remove trailing % and symbols for comparison
  battery_percent="$( command echo $battery_percent | command tr -d '%[,;]' )"

  # Change color based on battery percentage
  if [[ $battery_percent == 100 || $battery_status =~ "(charged|full)" ]]; then
    battery_color="green"
  elif [[ $battery_percent -lt $SPACESHIP_BATTERY_THRESHOLD ]]; then
    battery_color="red"
  else
    battery_color="yellow"
  fi

  # Battery indicator based on current status of battery
  if [[ $battery_status == "charging" ]];then
    battery_symbol="${SPACESHIP_BATTERY_SYMBOL_CHARGING}"
  elif [[ $battery_status =~ "^[dD]ischarg.*" ]]; then
    battery_symbol="${SPACESHIP_BATTERY_SYMBOL_DISCHARGING}"
  else
    battery_symbol="${SPACESHIP_BATTERY_SYMBOL_FULL}"
  fi

  # Escape % for display since it's a special character in Zsh prompt expansion
  if [[ $SPACESHIP_BATTERY_SHOW == 'always' ||
        $battery_percent -lt $SPACESHIP_BATTERY_THRESHOLD ||
        $SPACESHIP_BATTERY_SHOW == 'charged' && $battery_status =~ "(charged|full)" ]]; then
    spaceship::section \
      "$battery_color" \
      "$SPACESHIP_BATTERY_PREFIX" \
      "$battery_symbol$battery_percent%%" \
      "$SPACESHIP_BATTERY_SUFFIX"
  fi
}
