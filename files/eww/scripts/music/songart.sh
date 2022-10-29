#!/bin/bash

# thanks to kizu
TMP_DIR="$HOME/.cache/eww"
TMP_COVER_PATH=$TMP_DIR/cover.png
TMP_TEMP_PATH=$TMP_DIR/temp.png
songName="$HOME/.config/eww/scripts/music/tempsong"
songColor="$HOME/.config/eww/scripts/music/tempcolor"

get_song_art () {
  if [[ ! -d $TMP_DIR ]]; then
    mkdir -p $TMP_DIR
  fi

  ART_FROM_SPOTIFY="$(playerctl -p %any,spotify metadata mpris:artUrl | sed -e 's/open.spotify.com/i.scdn.co/g')"
  ART_FROM_BROWSER="$(playerctl -p %any,mpd,firefox,chromium,brave metadata mpris:artUrl | sed -e 's/file:\/\///g')"

  if [[ $(playerctl -p spotify,%any,firefox,chromium,brave,mpd metadata mpris:artUrl) ]]; then
    curl -s "$ART_FROM_SPOTIFY" --output $TMP_TEMP_PATH
  elif [[ -n $ART_FROM_BROWSER ]]; then
    cp $ART_FROM_BROWSER $TMP_TEMP_PATH
  else
    cp $HOME/.config/eww/assets/fallback.png $TMP_TEMP_PATH
  fi

}

echo_song_art_url() {
  echo "$HOME/.cache/eww/temp.png"
}

while true

if [[ $1 == "accent_solid" ]]; then
  if [[ $(head $songName) == "" ]]; then
    head $songColor
    cat > $songName <<< "$(playerctl metadata --format "{{title}}")"
  elif [[ $(head $songName) != "$(playerctl metadata --format "{{title}}")" ]]; then
    get_song_art  
    cat > songColor <<< "$(python $HOME/.config/eww/scripts/music/materialyoucolors.py $TMP_TEMP_PATH)"
    head -n 1 $songColor
    cat > $songName <<< "$(playerctl metadata --format "{{title}}")"
  else
      head -n 1 $songColor
  fi
fi

if [[ $1 == "button_accent" ]]; then
  head -n 2 $songColor | tail -1
fi

if [[ $1 == "button_text" ]]; then
  head -n 3 $songColor | tail -1
fi


if [[ $1 == "echo" ]]; then
  echo_song_art_url
fi

if [[ $1 == "accent" ]]; then
  get_song_accent
fi
