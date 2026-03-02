# Steelbore Theme for GNOME Terminal
# Version: 1.0
# Author: Mohamed Hammd
# License: GPL3+
# URL: https://steelbore.com
#
# Installation: Run this script in your terminal.
# It creates a new GNOME Terminal profile named "Steelbore".

#!/usr/bin/env bash

PROFILE_NAME="Steelbore"
PROFILE_SLUG="steelbore"

# Generate a new profile UUID
PROFILE_UUID=$(uuidgen)

# Get existing profile list
EXISTING=$(dconf read /org/gnome/terminal/legacy/profiles:/list)
if [ -z "$EXISTING" ]; then
    EXISTING="[]"
fi

# Add new profile UUID to list
NEW_LIST=$(echo "$EXISTING" | sed "s/]/, '$PROFILE_UUID']/" | sed "s/\[, /[/")
dconf write /org/gnome/terminal/legacy/profiles:/list "$NEW_LIST"

# Set profile properties
PROFILE_PATH="/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/"

dconf write "${PROFILE_PATH}visible-name" "'$PROFILE_NAME'"
dconf write "${PROFILE_PATH}use-theme-colors" "false"
dconf write "${PROFILE_PATH}background-color" "'#000027'"
dconf write "${PROFILE_PATH}foreground-color" "'#D98E32'"
dconf write "${PROFILE_PATH}cursor-colors-set" "true"
dconf write "${PROFILE_PATH}cursor-background-color" "'#E6E6F0'"
dconf write "${PROFILE_PATH}cursor-foreground-color" "'#000027'"
dconf write "${PROFILE_PATH}highlight-colors-set" "true"
dconf write "${PROFILE_PATH}highlight-background-color" "'#4B7EB0'"
dconf write "${PROFILE_PATH}highlight-foreground-color" "'#000027'"
dconf write "${PROFILE_PATH}palette" "['#000027', '#FF5C5C', '#50FA7B', '#D98E32', '#4B7EB0', '#BD93F9', '#8BE9FD', '#E6E6F0', '#6272A4', '#FF6E6E', '#69FF94', '#FFFFA5', '#D6ACFF', '#FF92DF', '#A4FFFF', '#FFFFFF']"
dconf write "${PROFILE_PATH}bold-is-bright" "true"

echo "Steelbore profile created for GNOME Terminal!"
echo "Go to Terminal → Preferences → Profiles → select 'Steelbore'."
