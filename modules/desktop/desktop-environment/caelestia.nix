{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.caelestia = {
    enable = lib.mkEnableOption "Caelestia Quickshell dots"
  };

  config = lib.mkIf config.c-opt.graphical.caelestia.enable {
    home-manager.users.${config.c-opt.user.name} = {
      programs.caelestia = {
        enable = true;
        systemd = {
          enable = false;
          target = "graphical-session.target";
          environment = [];
        };
        settings = {
          paths.wallpaperDir = "~/Pictures/Wallpapers"
        };
        cli = {
          enable = true;
          settings = {
            theme.enableGtk = false;
          };
        };
      };
    }
  };
}
