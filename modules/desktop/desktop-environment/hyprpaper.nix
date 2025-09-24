# Enable Hyprpaper.
# https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/

{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.hyprpaper.enable = lib.mkEnableOption "Hyprpaper";

  config = lib.mkIf config.c-opt.graphical.hyprpaper.enable {
    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [
        hyprpaper
      ];

      services.hyprpaper = {
        enable = true;
        settings = {
          ipc = "on";
        };
      };

    };
  };
}
