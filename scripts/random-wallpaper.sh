#!/user/bin/env bash
# Gets a random wallpaper.
WALLPAPER=$(find "$XDG_PICTURES_DIR/Wallpapers" -type f | shuf -n 1)

hyprctl hyprpaper reload ,"$WALLPAPER"
