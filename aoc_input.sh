#!/bin/bash

# This script follow the automation guidelines on the /r/adventofcode
# community
# [https://www.reddit.com/r/adventofcode/wiki/faqs/automation](wiki). Specifically:
#
#  * Once inputs are downloaded, they are cached locally (see end of this file)
#  * The User-Agent header is set to me since I maintain this tool :)

USER_AGENT="github.com/kfl/adventofcode_utils/blob/main/aoc_input.sh by ken@friislarsen.net"

YEAR=$1
DAY=$2

CURRENT_DATE=$(date '+%Y-%m-%d')

# If YEAR and DAY are not provided, use the current date
if [ -z "$YEAR" ]; then
    YEAR=$(date -d "$CURRENT_DATE" '+%Y')
fi
if [ -z "$DAY" ]; then
    DAY=$(date -d "$CURRENT_DATE" '+%d')
fi

# Read session cookie from file
COOKIE_FILE="session_cookie.txt"
if [ ! -f "$COOKIE_FILE" ]; then
    echo "Error: Session cookie file not found ($COOKIE_FILE)."
    exit 1
fi

AOC_SESSION_COOKIE=$(cat "$COOKIE_FILE")

# Create the directory for the day
DAY_DIR="day$(printf "%02d" "$DAY")"
mkdir -p "$DAY_DIR"

# Check if input.txt already exists
if [ -f "$DAY_DIR/input.txt" ]; then
    echo "Input file already exists for day $DAY."
else
    # Fetch input from Advent of Code and save it to input.txt
    INPUT_URL="https://adventofcode.com/$YEAR/day/$DAY/input"

    curl "$INPUT_URL" \
         --cookie "session=$AOC_SESSION_COOKIE" \
         --user-agent "$USER_AGENT" \
         -o "$DAY_DIR/input.txt"

    echo "Input fetched and saved for day $DAY."
fi
