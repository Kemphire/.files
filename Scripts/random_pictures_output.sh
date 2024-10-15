#!/bin/bash

DIR=$HOME/Pictures/wallpapers_many/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

echo $RANDOMPICS
