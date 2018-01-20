#
# Git commit_time
#
# Show time since previous commit
# Inspired from "hyperzsh" theme
# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_GIT_COMMITTIME_SHOW="${SPACESHIP_GIT_COMMITTIME_SHOW:=true}"
SPACESHIP_GIT_COMMITTIME_PREFIX="${SPACESHIP_GIT_COMMITTIME_PREFIX:=since }"
SPACESHIP_GIT_COMMITTIME_SUFFIX="${SPACESHIP_GIT_COMMITTIME_SUFFIX:=}"
SPACESHIP_GIT_COMMITTIME_THRESHOLD_LOW="${SPACESHIP_GIT_COMMITTIME_THRESHOLD_LOW:=30}" # in minutes
SPACESHIP_GIT_COMMITTIME_THRESHOLD_HIGH="${SPACESHIP_GIT_COMMITTIME_THRESHOLD_HIGH:=240}" # in minutes

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_git_committime() {
    [[ $SPACESHIP_GIT_COMMITTIME_SHOW == false ]] && return

    spaceship::is_git || return

    local commit_age

    # Get last commit
    last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)

    # Compute times
    now=$(date +%s)
    commit_age=$((now-last_commit))
    minutes=$((commit_age / 60))

    if [ "$minutes" -gt $SPACESHIP_GIT_COMMITTIME_THRESHOLD_HIGH ]; then
        COLOR="red"
    elif [ "$minutes" -gt $SPACESHIP_GIT_COMMITTIME_THRESHOLD_LOW ]; then
        COLOR="yellow"
    else
        COLOR="green"
    fi

    spaceship::section \
        "$COLOR" \
        "$SPACESHIP_GIT_COMMITTIME_PREFIX" \
        "$(spaceship::displaytime_short $commit_age)" \
        "$SPACESHIP_GIT_COMMITTIME_SUFFIX"
}
