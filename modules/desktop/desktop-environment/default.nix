{ config, lib, ... }:
{
  imports = [
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./quickshell.nix
    ./xdg.nix
  ];

  c-opt = {
    graphical = {
      fuzzel.enable = lib.mkDefault true;
      hypridle.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault true;
      hyprpaper.enable = lib.mkDefault true;
      quickshell.enable = lib.mkDefault true;
      xdg.enable = lib.mkDefault true;
    };
  };
}
