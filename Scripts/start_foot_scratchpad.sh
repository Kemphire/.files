#!/bin/bash

# start foot
foot &

# wait for 1 sec for proper foot to boot up
sleep 1

# move it to scratchpad
swaymsg for_window [app_id="foot$"] move scratchpad
