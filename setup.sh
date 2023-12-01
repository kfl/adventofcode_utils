#!/bin/bash

TEMPLATE_DIR=$1
DAY_NUMBER=$2

if [ -z "$TEMPLATE_DIR" ]; then
    echo "Please provide the template directory name as the first argument."
    exit 1
fi

if [ -z "$DAY_NUMBER" ]; then
    CURRENT_DATE=$(date '+%d')
    DAY_NUMBER=$(printf "%d" "$CURRENT_DATE")
fi

SCRIPT_DIR=$(dirname "$0")
TEMPLATE_PATH="$SCRIPT_DIR/$TEMPLATE_DIR"

DAY_DIR="day$(printf "%02d" "$DAY_NUMBER")"

# Check if the directory already exists or create it
mkdir -p "$DAY_DIR" || { echo "Failed to create directory $DAY_DIR"; exit 1; }

# Copy and rename files from the template directory to the new day directory
for file in "$TEMPLATE_PATH"/*; do
    if [ -f "$file" ]; then
        filename=$(basename -- "$file")
        new_filename=$(echo "$filename" | sed "s/DAY/$DAY_DIR/g")
        cp "$file" "$DAY_DIR/$new_filename" || { echo "Failed to copy $filename to $DAY_DIR"; exit 1; }

        # Replace occurrences of "DAY" with the day-specific directory name
        sed -i'.bak' "s/DAY/${DAY_DIR}/g" "$DAY_DIR/$new_filename" || { echo "Failed to replace strings in $new_filename"; exit 1; }
        rm -rf "$DAY_DIR/*.bak"
    fi
done

echo "Day $DAY_NUMBER setup completed using template $TEMPLATE_DIR in directory $DAY_DIR."
