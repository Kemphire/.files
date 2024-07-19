#!/bin/bash

# start foot
foot &

# move it to scratchpad
swaymsg for_window [app_id="foot$"] move scratchpad
