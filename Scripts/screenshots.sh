#!/bin/bash

# Get the current date and time in the format YYYY-MM-DD_HH-MM-SS
current_time=$(date +"%Y-%m-%d_%H-%M-%S")

directory=~/Pictures/Screenshots


filename="screenshot_$current_time.png"

filepath="$directory/$filename"

# Take the screenshot and save it to the specified path
grim -g "$(slurp)" - | swappy -f - -o "$filepath"

# Notify the user
# echo "Screenshot saved to $filepath"
notify-send --icon="$filename" "Image saved in $filename"


