{ config, lib, ... }:
{
  imports = [
    ./plasma6.nix

    ./fuzzel.nix
    ./hyprland.nix
#     ./hyprlock.nix
    ./waybar.nix
#     ./wlogout.nix
    ./xdg.nix
  ];

  c-opt = {
    plasma.enable = lib.mkDefault false;
    graphical = {
#       fuzzel.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault true;
      waybar.enable = lib.mkDefault true;
      xdg.enable = lib.mkDefault true;
    };
  };
}
