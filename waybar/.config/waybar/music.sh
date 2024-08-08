#!/bin/bash

isSpotify=$(playerctl metadata | grep spotify | wc -l)

if [ ! $isSpotify -eq 0 ]; then
    title=$(playerctl metadata | grep title | awk '{$1=$2=""; print $0}' | sed 's/^ *//')
    artist=$(playerctl metadata | grep ":artist" | awk '{$1=$2=""; print $0}' | sed 's/^ *//')

    echo $title - $artist
fi
