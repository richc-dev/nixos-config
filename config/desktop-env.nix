# Options for the desktop environment.
{ config, lib, ... }:
{
  options.c-opt.de = {
    enable = lib.mkEnableOption "Enable desktop";
    hyprlock.enable = lib.mkEnableOption "Enable hyprlock";
    noctalia.enable = lib.mkEnableOption "Enable Noctalia desktop shell";
    sddm.enable = lib.mkEnableOption "Enable SDDM Display Manager";
  };

  config.c-opt = {
    graphical = {
      fuzzel.enable = lib.mkDefault config.c-opt.de.enable;
      hypridle.enable = lib.mkDefault config.c-opt.de.enable;
      hyprland.enable = lib.mkDefault false;
      hyprpaper.enable = lib.mkDefault false;
      quickshell.enable = lib.mkDefault false;
    };

    de = {
      enable = lib.mkDefault true;
      hyprlock.enable = lib.mkDefault config.c-opt.de.enable;
      niri.enable = lib.mkDefault config.c-opt.de.enable;
      noctalia.enable = lib.mkDefault config.c-opt.de.enable;
      sddm.enable = lib.mkDefault config.c-opt.de.enable;
      xdg.enable = lib.mkDefault config.c-opt.de.enable;
    };
  };
}
