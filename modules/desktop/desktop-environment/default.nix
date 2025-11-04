{ config, lib, ... }:
{
  imports = [
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./niri.nix
    ./quickshell.nix
    ./xdg.nix
  ];
}
