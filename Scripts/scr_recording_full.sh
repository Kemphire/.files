#!/bin/bash

# Get the current date and time in the format YYYY-MM-DD_HH-MM-SS
current_time=$(date +"%Y-%m-%d_%H-%M-%S")

directory=~/Pictures/screen_recordings

mkdir -p $directory

filename="screenshot_recording$current_time.mp4"

filepath="$directory/$filename"


wf-recorder -f "$filepath" 

notify-send "To stop press print and select C"

# Notify the user
# echo "Screenshot saved to $filepath"
notify-send --icon="$filepath" "Video saved in $filename"
