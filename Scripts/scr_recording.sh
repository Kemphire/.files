#!/bin/bash

# Get the current date and time in the format YYYY-MM-DD_HH-MM-SS
current_time=$(date +"%Y-%m-%d_%H-%M-%S")

directory=~/Pictures/screen_recordings

mkdir -p $directory

filename="screenshot_recording$current_time.mp4"

filepath="$directory/$filename"

geometry="$(slurp)"

if [ $? -ne 0 ]; then
	notify-send "Screen recording cancelled, No file saved"
	exit 1
fi

notify-send "To stop press ctrl-shift-x"

sleep 1

wf-recorder -f "$filepath" -g "$geometry"

wf_recorder_pid=$!


# Notify the user
# echo "Screenshot saved to $filepath"
notify-send --icon="$filepath" "Video saved in $filename"


