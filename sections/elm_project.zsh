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

  local project_file=''
  if [[ -f elm.json ]]; then
    project_file='elm.json'
  elif [[ -f elm-package.json ]]; then
    project_file='elm-package.json'
  else
    return
  fi

  local show_package="${SPACESHIP_ELM_PROJECT_PACKAGE_SHOW}"
  local show_application="${SPACESHIP_ELM_PROJECT_APPLICATION_SHOW}"

  local project_type=$(grep '"type":' "${project_file}" | cut -d\" -f4 2> /dev/null)
  if [[ -z "${project_type}" ]]; then
    project_type='package'
  fi
  [[ "${project_type}" == 'package' && "${show_package}" == 'never' ]] && return
  [[ "${project_type}" == 'application' && "${show_application}" == 'never' ]] && return

  local project_info=''
  local project_color=''
  local project_prefix=''
  local project_suffix=''
  if [[ "${project_type}" == 'package' ]]; then
    local project_version=$(grep -E '"version":' "${project_file}" | cut -d\" -f4 2> /dev/null)
    [[ -z "${project_version}" ]] && return
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
    return # error with package type
  fi

  local show_version="${SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW}"

  local elm_version=$(elm --version 2> /dev/null)
  if [[ -z "${elm_version}" ]]; then
    show_version=false # error getting version
  fi

  local project_elm_version=$(grep -E '"elm-version":' "${project_file}" | cut -d\" -f4 2> /dev/null)
  if [[ -z "${project_elm_version}" ]]; then
    show_version=false # error parsing
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
        show_version=false # error comparing
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
  if [[ ( "${version_mismatch}" == true && "${show_version}" == 'mismatch' ) ]] || \
     [[ $SPACESHIP_ELM_PROJECT_ELM_VERSION_SHOW == 'always' ]]
  then
    decorated_elm_version="${decorated_elm_version}%{%B%F{${SPACESHIP_ELM_PROJECT_ELM_VERSION_COLOR}%}"
    decorated_elm_version="${decorated_elm_version}${SPACESHIP_ELM_PROJECT_ELM_VERSION_PREFIX}"
    decorated_elm_version="${decorated_elm_version}${project_elm_version}"
    decorated_elm_version="${decorated_elm_version}${SPACESHIP_ELM_PROJECT_ELM_VERSION_SUFFIX}"
    decorated_elm_version="${decorated_elm_version}%{%B%F{${SPACESHIP_ELM_PROJECT_COLOR}%}"
  fi

  spaceship::section \
    "$project_color" \
    "$project_prefix" \
    "${project_info}${decorated_elm_version}" \
    "$project_suffix"
}
