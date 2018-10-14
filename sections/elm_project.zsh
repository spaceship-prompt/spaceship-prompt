#
# Elm Project
#
# Current elm project's package version and elm version.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_ELM_PROJECT_SHOW="${SPACESHIP_ELM_PROJECT_SHOW=true}"

SPACESHIP_ELM_PROJECT_PACKAGE_SHOW="${SPACESHIP_ELM_PROJECT_PACKAGE_SHOW=true}"
SPACESHIP_ELM_PROJECT_PACKAGE_PREFIX="${SPACESHIP_ELM_PROJECT_PACKAGE_PREFIX="is "}"
SPACESHIP_ELM_PROJECT_PACKAGE_SYMBOL="${SPACESHIP_ELM_PROJECT_SYMBOL="📦 "}"
SPACESHIP_ELM_PROJECT_PACKAGE_SUFFIX="${SPACESHIP_ELM_PROJECT_PACKAGE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ELM_PROJECT_PACKAGE_COLOR="${SPACESHIP_ELM_PROJECT_PACKAGE_COLOR="blue"}"

SPACESHIP_ELM_PROJECT_APPLICATION_SHOW="${SPACESHIP_ELM_PROJECT_APPLICATION_SHOW=true}"
SPACESHIP_ELM_PROJECT_APPLICATION_PREFIX="${SPACESHIP_ELM_PROJECT_APPLICATION_PREFIX="is "}"
SPACESHIP_ELM_PROJECT_APPLICATION_SYMBOL="${SPACESHIP_ELM_PROJECT_APPLICATION_SYMBOL="🖥️ "}"
SPACESHIP_ELM_PROJECT_APPLICATION_TEXT="${SPACESHIP_ELM_PROJECT_APPLICATION_TEXT="App"}"
SPACESHIP_ELM_PROJECT_APPLICATION_SUFFIX="${SPACESHIP_ELM_PROJECT_APPLICATION_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_ELM_PROJECT_APPLICATION_COLOR="${SPACESHIP_ELM_PROJECT_APPLICATION_COLOR="cyan"}"

SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW="${SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW="mismatch"}"
SPACESHIP_ELM_PROJECT_ELM_VERSION_PREFIX="${SPACESHIP_ELM_PROJECT_ELM_VERSION_PREFIX=" ("}"
SPACESHIP_ELM_PROJECT_ELM_VERSION_SUFFIX="${SPACESHIP_ELM_PROJECT_ELM_VERSION_SUFFIX=")"}"
SPACESHIP_ELM_PROJECT_ELM_VERSION_COLOR="${SPACESHIP_ELM_PROJECT_ELM_VERSION_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_elm_project() {
  [[ $SPACESHIP_ELM_PROJECT_SHOW == false ]] && return

  spaceship::exists elm || return

  #echo >&2 "$SPACESHIP_ELM_PROJECT_SHOW"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_PACKAGE_SHOW"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_PACKAGE_PREFIX"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_PACKAGE_SYMBOL"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_PACKAGE_SUFFIX"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_PACKAGE_COLOR"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_APPLICATION_SHOW"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_APPLICATION_PREFIX"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_APPLICATION_SYMBOL"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_APPLICATION_TEXT"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_APPLICATION_SUFFIX"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_APPLICATION_COLOR"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_ELM_VERSION_PREFIX"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_ELM_VERSION_SUFFIX"
  #echo >&2 "$SPACESHIP_ELM_PROJECT_ELM_VERSION_COLOR"

  local project_file=''
  if [[ -f elm.json ]]; then
    project_file='elm.json'
  elif [[ -f elm-package.json ]]; then
    project_file='elm-package.json'
  else
    # Error: project file not found
    return
  fi

  local show_package="${SPACESHIP_ELM_PROJECT_PACKAGE_SHOW}"
  local show_application="${SPACESHIP_ELM_PROJECT_APPLICATION_SHOW}"

  local project_type=$(grep '"type":' "${project_file}" | cut -d\" -f4 2> /dev/null)
  if [[ -z "${project_type}" ]]; then
    project_type='package'
  fi
  [[ "${project_type}" == 'package' && "${show_package}" == false ]] && return
  [[ "${project_type}" == 'application' && "${show_application}" == false ]] && return


  local project_info=''
  local project_color=''
  local project_prefix=''
  local project_suffix=''
  if [[ "${project_type}" == 'package' ]]; then
    local project_version=$(grep -E '"version":' "${project_file}" | cut -d\" -f4 2> /dev/null)
    if [[ -z "${project_version}" ]]; then
      # Error: package version could not be parsed
      return
    fi
    project_info="${SPACESHIP_ELM_PROJECT_PACKAGE_SYMBOL}v${project_version}"
    project_color="${SPACESHIP_ELM_PROJECT_PACKAGE_COLOR}"
    project_prefix="${SPACESHIP_ELM_PROJECT_PACKAGE_PREFIX}"
    project_suffix="${SPACESHIP_ELM_PROJECT_PACKAGE_SUFFIX}"
  elif [[ "${project_type}" == 'application' ]]; then
    project_info="${SPACESHIP_ELM_PROJECT_APPLICATION_SYMBOL}${SPACESHIP_ELM_PROJECT_APPLICATION_TEXT}"
    project_color="${SPACESHIP_ELM_PROJECT_APPLICATION_COLOR}"
    project_prefix="${SPACESHIP_ELM_PROJECT_APPLICATION_PREFIX}"
    project_suffix="${SPACESHIP_ELM_PROJECT_APPLICATION_SUFFIX}"
  else
    # Error: project type could not be parsed
    return
  fi

  local show_version="${SPACESHIP_ELM_PROJECT_VERSION_SHOW}"

  local elm_version=$(elm --version 2> /dev/null)
  if [[ -z "${elm_version}" ]]; then
    # Error: elm --version was empty
    show_version=false
  fi

  local project_elm_version=$(grep -E '"elm-version":' "${project_file}" | cut -d\" -f4 2> /dev/null)
  if [[ -z "${project_elm_version}" ]]; then
    # Error: elm-version could not be parsed
    show_version=false
  fi

  local version_mismatch=false
  if [[ "${show_package}" == 'mismatch' ]] || \
     [[ "${show_application}" == 'mismatch' ]] || \
     [[ "${show_version}" == 'mismatch' ]]
  then
    if [[ "${project_elm_version}" =~ "([-.0-9a-zA-Z]+) <= v < ([-.0-9a-zA-Z]+)" ]]; then
      local diff_lower=$(spaceship::compare_semver "${elm_version}" "${match[1]}")
      local diff_upper=$(spaceship::compare_semver "${elm_version}" "${match[2]}")
      if [[ -z "${diff_lower}" || -z "${diff_upper}" ]]; then
        # Error: elm versions could not be compared
        show_version=false
      fi
      if ((diff_lower < 0)) || ((diff_upper >= 0)); then
        version_mismatch=true
      fi
    else
      local diff=$(spaceship::compare_semver "${elm_version}" "${project_elm_version}")
      if ((diff != 0)); then
        version_mismatch=true
      fi
    fi
  fi

  if [[ "${version_mismatch}" == false ]]; then
    [[ "${project_type}" == 'package' && "${show_package}" == 'mismatch' ]] && return
    [[ "${project_type}" == 'application' && "${show_application}" == 'mismatch' ]] && return
  fi

  local decorated_elm_version=''
  if [[ "${version_mismatch}" == true && "${show_version}" == 'mismatch' ]] || \
     [[ "${show_version}" == true ]]
  then
    decorated_elm_version="${decorated_elm_version}%{%B%F{${SPACESHIP_ELM_PROJECT_ELM_VERSION_COLOR}%}"
    decorated_elm_version="${decorated_elm_version}${SPACESHIP_ELM_PROJECT_ELM_VERSION_PREFIX}"
    decorated_elm_version="${decorated_elm_version}${project_elm_version}"
    decorated_elm_version="${decorated_elm_version}${SPACESHIP_ELM_PROJECT_ELM_VERSION_SUFFIX}"
    decorated_elm_version="${decorated_elm_version}%{%B%F{${project_color}%}"
  fi

  spaceship::section \
    "$project_color" \
    "$project_prefix" \
    "${project_info}${decorated_elm_version}" \
    "$project_suffix"
}
