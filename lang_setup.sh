#!/bin/bash

# This script conditionally appends two specific environment variable exports
# to the user's profile file (~/.profile) if they are not already present.

# --- Configuration ---
# The target file (expanded to /home/user/.profile)
PROFILE_FILE="~/.profile"
LINE_ONE="export LANG=en_US.UTF-8"
LINE_TWO="export LANGUAGE=en_US:en"
# ---------------------

# Resolve the tilde (~) to the actual home directory path
TARGET_FILE=$(eval echo $PROFILE_FILE)

echo "--- Starting Profile Language Update Script ---"
echo "Target file: $TARGET_FILE"

# Function to check and append a line if it doesn't exist
append_if_missing() {
    local line_to_check="$1"
    local file="$2"

    # Use grep to check if the line already exists in the file
    # -q: quiet mode (suppress output)
    # -F: fixed strings (treat the pattern as a literal string, no regex)
    grep -qF "$line_to_check" "$file"

    if [ $? -eq 0 ]; then
        # Exit status 0 means the line was found
        echo "FOUND: \"$line_to_check\" is already present. Skipping."
    else
        # Non-zero exit status means the line was not found
        echo "MISSING: \"$line_to_check\" will be appended to $file."

        # Append the line, adding a comment and an empty line for clarity
        if echo -e "\n# Added by configuration script on $(date +%Y-%m-%d)\n$line_to_check" >> "$file"; then
             echo "SUCCESS: Line appended."
        else
             echo "ERROR: Failed to append line to $file. Check file permissions."
        fi
    fi
}

# 1. Check if the target file exists. If not, create it first.
if [ ! -f "$TARGET_FILE" ]; then
    echo "NOTICE: $TARGET_FILE does not exist. Creating it now."
    touch "$TARGET_FILE"
fi

# 2. Process Line One
append_if_missing "$LINE_ONE" "$TARGET_FILE"

# 3. Process Line Two
append_if_missing "$LINE_TWO" "$TARGET_FILE"

echo "--- Profile update complete ---"
echo ""
echo "!!! IMPORTANT: To apply these changes immediately, run the following command:"
echo "source $TARGET_FILE"
