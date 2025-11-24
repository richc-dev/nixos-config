# Options for the desktop environment.
{ config, lib, ... }:
{
  options.c-opt.de = {
    noctalia.enable = lib.mkEnableOption "Enable Noctalia desktop shell";
    sddm.enable = lib.mkEnableOption "Enable SDDM Display Manager";
  };

  config.c-opt = {
    graphical = {
      fuzzel.enable = lib.mkDefault true;
      hypridle.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault false;
      hyprpaper.enable = lib.mkDefault false;
      quickshell.enable = lib.mkDefault false;
    };

    de = {
      niri.enable = lib.mkDefault true;
      noctalia.enable = lib.mkDefault true;
      sddm.enable = lib.mkDefault true;
      xdg.enable = lib.mkDefault true;
    };
  };
}
