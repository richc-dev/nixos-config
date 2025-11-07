{ config, lib, ... }:
{
  imports = [
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./keyboard.nix
    ./niri.nix
    ./noctalia.nix
    ./sddm.nix
    ./quickshell.nix
    ./xdg.nix
  ];
}
