# example.zsh
# A demonstration Spaceship style
# Keep such files in $SPACESHIP_CUSTOM/styles

# Uncomment the following line if you want to remove effects of any previously loaded styles.
# Might be a good idea for a base style.
# spaceship::load_style reset false

# You can also load another style as your base if this is modification.
# Just make sure you don't fall into an infinite recursion.
# Also pass the second argument as false to avoid redundancy in loading sections.
spaceship::load_style robbyrussel false

# Add your customisations to the following lines.

# Define the order of sections, you can also add your custom sections by adding the appropriate
# section definition as a .zsh file to $SPACESHIP_CUSTOM/sections and adding it to either
# SPACESHIP_PROMPT_ORDER or SPACESHIP_RPROMPT_ORDER.
SPACESHIP_RPROMPT_ORDER=(battery)

# Define your own options as follows
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT="%D{%H:%M}"

# Any option that is not defined here will be read from the previously loaded style.

# You can also reset the value of any option to its default value by unsetting it and running
# 'spaceship::load_section sectionname true' or 'spaceship::load_required_section true'
# unset SPACESHIP_HOST_SHOW
# spaceship:load_section host true