#!/usr/bin/env bash
#
if [[ $1 == "title" ]]; then
  playerctl metadata --format "{{title}}" || echo "Not playing"
fi

if [[ $1 == "artist" ]]; then
  playerctl metadata --format "{{artist}}" || echo "No artist"
fi

if [[ $1 == "status" ]]; then
  playerctl status || echo 'Paused'
fi
