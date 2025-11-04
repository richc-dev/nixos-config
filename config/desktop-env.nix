# Options for the desktop environment.
{ config, lib, ... }:
{
  options.c-opt.de = {

  };

  config.c-opt = {
    graphical = {
      fuzzel.enable = lib.mkDefault true;
      hypridle.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault true;
      hyprpaper.enable = lib.mkDefault true;
      quickshell.enable = lib.mkDefault true;
    };

    de = {
      niri.enable = lib.mkDefault false;
      xdg.enable = lib.mkDefault true;
    };
  };
}
