# ------------------------------------------------------------------------------
# CORE RENDERER
# Tools for loading sections, building sections and invoking the renderer
# ------------------------------------------------------------------------------

# Unique array of async jobs
typeset -ahU SPACESHIP_JOBS=()

# Loads the sections from files and functions
# USAGE:
#   spaceship::core::load_sections
spaceship::core::load_sections() {
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
      spaceship::core::skip_section "$section"
      continue
    fi

    if spaceship::is_section_async "$section"; then
      load_async=true
    fi
  done

  if ${load_async}; then
    (( ASYNC_INIT_DONE )) || source "${SPACESHIP_ROOT}/async.zsh"
  fi
}

# Iterate over sections, start async jobs and store results in cache
# USAGE:
#   spaceship::core::build_cache
spaceship::core::build_cache() {
  # Clear the cache before every render
  spaceship::cache::clear

  for section in $(spaceship::union $SPACESHIP_PROMPT_ORDER $SPACESHIP_RPROMPT_ORDER); do
    spaceship::core::refresh_section "$section"
  done
}

# A function to be called after async job execution
# USAGE:
#   spaceship::core::async_callback
spaceship::core::async_callback() {
  local job="$1" ret="$2" output="$3" exec_time="$4" err="$5" has_next="$6"
  local section

  # ignore the async evals used to alter worker environment
  if [[ "${job}" == "[async/eval]" ]] \
  || [[ "${job}" == ";" ]] \
  || [[ "${job}" == "[async]" ]]; then
    # FIXME: Restart the async job if it failed
    return
  fi

  section="${job#"spaceship_"}" # TODO: Move spaceship_ to a constant

  SPACESHIP_JOBS=("${(@)SPACESHIP_JOBS:#${section}}")

  # Refresh async section when the last async job has finished
  if [[ "${#SPACESHIP_JOBS}" -eq 0 ]]; then
    spaceship::core::refresh_section "async"
    spaceship::core::render
  fi

  # Skip prompt re-rendering if section is empty
  if [[ "$(spaceship::cache::get $section)" == "$output" ]]; then
    return
  fi

  spaceship::cache::set "$section" "$output"

  if [[ "$has_next" == 0 ]]; then
    spaceship::core::render
  fi
}

# Refreshes the cache of a section. If the section is async, it will be
# executed in a separate process.
# USAGE:
#   spaceship::core::refresh_section [section]
spaceship::core::refresh_section() {
  local section="$1"

  [[ -z $section ]] && return 1

  # Option EXTENDED_GLOB is set locally to force filename generation on
  # argument to conditions, i.e. allow usage of explicit glob qualifier (#q).
  # See the description of filename generation in
  # http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
  setopt EXTENDED_GLOB LOCAL_OPTIONS

  if ! spaceship::defined "spaceship_$section"; then
    spaceship::core::skip_section "$section"
    return 1
  fi

  if spaceship::is_section_async "$section"; then
    SPACESHIP_JOBS+=("$section")
    async_job "spaceship" "spaceship_${section}"
  else
    spaceship::cache::set "$section" "$(spaceship_$section)"
  fi
}

# Removes a section from both prompts and prints a message,
# so that we avoid printing errors over and over.
# USAGE:
#  spaceship::core::skip_section <section>
spaceship::core::skip_section() {
  local section="$1"
  print -P "%F{yellow}Warning!%f The '%F{cyan}${section}%f' section was not found. Removing it from the prompt."
  SPACESHIP_PROMPT_ORDER=("${(@)SPACESHIP_PROMPT_ORDER:#${section}}")
  SPACESHIP_RPROMPT_ORDER=("${(@)SPACESHIP_RPROMPT_ORDER:#${section}}")
}

# Render and reset the prompt asyncronously.
# USAGE:
#   spaceship::core::render
spaceship::core::render() {
  spaceship::populate

  # .reset-prompt: bypass the zsh-syntax-highlighting wrapper
  # https://github.com/sorin-ionescu/prezto/issues/1026
  # https://github.com/zsh-users/zsh-autosuggestions/issues/107#issuecomment-183824034
  zle .reset-prompt && zle -R
}
