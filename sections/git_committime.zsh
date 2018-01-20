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

    _is_git || return

    local commit_age

    # Get last commit
    last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit/3600))

    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))

    if [ $hours -gt 24 ]; then
	commit_age="${days}d "
    elif [ $minutes -gt 60 ]; then
	commit_age="${sub_hours}h${sub_minutes}m "
    else
	commit_age="${minutes}m "
    fi

    if [ "$minutess" -gt $SPACESHIP_GIT_COMMITTIME_THRESHOLD_HIGH ]; then
        COLOR="red"
    elif [ "$minutes" -gt $SPACESHIP_GIT_COMMITTIME_THRESHOLD_LOW ]; then
        COLOR="yellow"
    else
        COLOR="green"
    fi

    spaceship::section \
    	"$COLOR" \
    	"$SPACESHIP_GIT_COMMITTIME_PREFIX" \
    	"$commit_age" \
        "$SPACESHIP_GIT_COMMITTIME_SUFFIX"
}
