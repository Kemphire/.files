#!/bin/bash
# Open Firefox
firefox &

# Wait for Firefox to start
sleep 2

# Move Firefox to workspace 2
wmctrl -r "Mozilla Firefox" -t 1
