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
      hyprland.enable = lib.mkDefault true;
      hyprpaper.enable = lib.mkDefault true;
      quickshell.enable = lib.mkDefault true;
    };

    de = {
      niri.enable = lib.mkDefault false;
      noctalia.enable = lib.mkDefault true;
      sddm.enable = lib.mkDefault true;
      xdg.enable = lib.mkDefault true;
    };
  };
}
