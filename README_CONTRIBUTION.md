# Fix for Duplicate Git Icons in Spaceship Prompt

## Description
This contribution addresses an issue where duplicate Git icons appear in the Zsh prompt when using the Spaceship theme. The fix ensures that only one Git icon is displayed before the branch name.

## Issue Details
- **Issue:** Duplicate Git icons in the prompt.
- **Expected Behavior:** Only one Git icon should appear before the branch name.
- **Reproducible Environment:**
  - Spaceship Version: v4.13.4
  - Zsh Version: 5.9
  - Operating System: macOS 14.1
  - Terminal Emulator: VS Code Integrated Terminal
  - Zsh Framework: Oh My Zsh

## Steps to Reproduce
1. Install Spaceship Prompt using Oh My Zsh.
2. Navigate to a Git repository.
3. Observe the prompt: duplicate Git icons appear before the branch name.

## Solution
The issue was caused by redundant rendering logic in the Git section of Spaceship. The fix ensures that the Git icon is only rendered once.

### Changes Made
- Modified the `sections/git.zsh` file to prevent duplicate rendering of the Git icon.
- Added a conditional check to ensure the Git icon is only displayed once.

### Code Changes
```zsh
# Ensure the Git icon is only added once
if [[ $SPACESHIP_GIT_SHOW == true ]]; then
  spaceship::section::v4 --color "$SPACESHIP_GIT_COLOR" --prefix "$SPACESHIP_GIT_PREFIX" --symbol "$SPACESHIP_GIT_SYMBOL" "$git_info"
fi

