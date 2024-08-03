#!/usr/bin/env bash

shopt -s nullglob
image_dir="/home/hitmonlee/Pictures/wallpapers_many/"
images=("$image_dir"*.jpg)
echo "${images[$RANDOM % ${#images[@]}]}"
