#!/bin/bash

# open flatpak firefox

vivaldi

# wait for 0.25s

sleep 0.25

# open firefox in workspace 2
swaymsg for_window [app_id="vivaldi-stable"] move container to workspace number 2
