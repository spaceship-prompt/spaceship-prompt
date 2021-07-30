# ------------------------------------------------------------------------------
# RENDERER
# Tools for loading sections, building sections and invoking the renderer
# ------------------------------------------------------------------------------

# Unique array of async jobs
typeset -aU SPACESHIP_JOBS=()

# Loads the sections from files and functions
# USAGE:
#   spaceship::load_sections
spaceship::load_sections() {
  local load_async=false

  # Iterate over sections
  for section in $(spaceship::union $SPACESHIP_PROMPT_ORDER $SPACESHIP_RPROMPT_ORDER); do
    if spaceship::defined "spaceship_$section"; then
      # Custom section is declared, nothing else to do
      continue
    elif [[ -f "$SPACESHIP_ROOT/sections/$section.zsh" ]]; then
      source "$SPACESHIP_ROOT/sections/$section.zsh"
    else
      # section is not found!
      # when this happens, we remove the section from the configured elements,
      # so that we avoid printing errors over and over.
      print -P "%F{yellow}Warning!%f The '%F{cyan}${section}%f' section was not found. Removing it from the prompt."
      SPACESHIP_PROMPT_ORDER=("${(@)SPACESHIP_PROMPT_ORDER:#${section}}")
      SPACESHIP_RPROMPT_ORDER=("${(@)SPACESHIP_RPROMPT_ORDER:#${section}}")
    fi

    if $(spaceship::is_section_async $section); then
      load_async=true
    fi
  done

  if ${load_async}; then
    (( ASYNC_INIT_DONE )) || source "${SPACESHIP_ROOT}/async/async.zsh"
  fi
}

# Iterate over sections, start async jobs and store results in cache
# USAGE:
#   spaceship::start_async_jobs
spaceship::start_async_jobs() {
  # Clear the cache before every render
  spaceship::clear_cache

  for section in $(spaceship::union $SPACESHIP_PROMPT_ORDER $SPACESHIP_RPROMPT_ORDER); do
    if $(spaceship::is_section_async $section); then
      SPACESHIP_JOBS+=("$section")
      async_job "spaceship" "spaceship_${section}"
    fi
  done
}

# Render the prompt. Compose variables using prompt functoins.
# USAGE:
#   spaceship::render
spaceship::async_callback() {
  local job="$1" ret="$2" output="$3" exec_time="$4" err="$5" has_next="$6"
  local section

  # ignore the async evals used to alter worker environment
  if [[ "${job}" == "[async/eval]" ]] \
  || [[ "${job}" == ";" ]] \
  || [[ "${job}" == "[async]" ]]; then
    return
  fi

  section="${job#"spaceship_"}" # TODO: Move spaceship_ to a constant

  SPACESHIP_JOBS=("${(@)SPACESHIP_JOBS:#${section}}")

  # Skip prompt re-rendering if section is empty
  # Do not skip re-rendering when the last async job has finished
  if [[ "$(spaceship::get_cache $section)" == "$output" ]] \
  && [[ ${#SPACESHIP_JOBS} -ne 0 ]]; then
    return
  fi

  spaceship::set_cache "$section" "$output"

  if [[ "$has_next" == 0 ]]; then
    spaceship::async_render
  fi
}

# Render the prompt. Compose variables using prompt functoins.
# USAGE:
#   spaceship::render
spaceship::render() {
  PROMPT='$(spaceship::prompt)'
  RPROMPT='$(spaceship::rprompt)'
  PS2='$(spaceship::ps2)'
}

# Render and reset the prompt asyncronously.
# USAGE:
#   spaceship::async_render
spaceship::async_render() {
  spaceship::render

  # .reset-prompt: bypass the zsh-syntax-highlighting wrapper
  # https://github.com/sorin-ionescu/prezto/issues/1026
  # https://github.com/zsh-users/zsh-autosuggestions/issues/107#issuecomment-183824034
  zle .reset-prompt && zle -R
}

# Compose whole prompt from sections
# USAGE:
#   spaceship::compose_prompt [section...]
spaceship::compose_prompt() {
  # Option EXTENDED_GLOB is set locally to force filename generation on
  # argument to conditions, i.e. allow usage of explicit glob qualifier (#q).
  # See the description of filename generation in
  # http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  # Reset the first prefix value
  _spaceship_prompt_opened="$SPACESHIP_PROMPT_FIRST_PREFIX_SHOW"

  # Treat the first argument as list of prompt sections
  # Compose whole prompt from diferent parts
  for section in $@; do
    local output="" meta=()
    local color="" prefix="" content="" suffix=""

    if $(spaceship::is_async) && $(spaceship::is_section_async $section); then
      output="$(spaceship::get_cache $section)"
    else
      output="$(spaceship_$section)"
    fi

    spaceship::render_section "$output"
  done
}
