#!/user/bin/env bash
# Gets a random wallpaper.
WALLPAPER=$(find "$HOME/Pictures/Wallpapers" -type f | shuf -n 1)
hyprctl hyprpaper reload ,"$WALLPAPER"
