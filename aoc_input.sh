#!/bin/bash

YEAR=$1
DAY=$2

# If YEAR and DAY are not provided, use the current date
if [ -z "$YEAR" ] || [ -z "$DAY" ]; then
    CURRENT_DATE=$(date '+%Y-%m-%d')
    YEAR=$(date -d "$CURRENT_DATE" '+%Y')
    DAY=$(date -d "$CURRENT_DATE" '+%d')
fi

# Read AOC_SESSION_COOKIE from environment variable
if [ -z "$AOC_SESSION_COOKIE" ]; then
    echo "Error: AOC_SESSION_COOKIE environment variable is not set."
    exit 1
fi

# Create the directory for the day
DAY_DIR="day$(printf "%02d" $DAY)"
mkdir -p $DAY_DIR

# Check if input.txt already exists
if [ -f "$DAY_DIR/input.txt" ]; then
    echo "Input file already exists for day $DAY."
else
    # Fetch input from Advent of Code and save it to input.txt
    INPUT_URL="https://adventofcode.com/$YEAR/day/$DAY/input"

    curl "$INPUT_URL" -H "cookie: session=$AOC_SESSION_COOKIE" --user-agent "User-Agent: github.com/kfl/adventofcode_utils/blob/main/aoc_input.sh by ken@friislarsen.net" -o "$DAY_DIR/input.txt"

    echo "Input fetched and saved for day $DAY."
fi
