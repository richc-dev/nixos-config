{ config, lib, ... }:
{
  imports = [
    ./plasma6.nix

    ./caelestia.nix
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./quickshell.nix
#     ./wlogout.nix
    ./xdg.nix
  ];

  c-opt = {
    plasma.enable = lib.mkDefault false;
    graphical = {
      caelestia.enable = lib.mkDefault true;
      fuzzel.enable = lib.mkDefault true;
      hypridle.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault true;
      hyprpaper.enable = lib.mkDefault true;
      quickshell.enable = lib.mkDefault true;
      xdg.enable = lib.mkDefault true;
    };
  };
}
