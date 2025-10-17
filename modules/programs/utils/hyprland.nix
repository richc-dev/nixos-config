# Enable Hyprland specific utilities.

{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.graphical.hyprland.enable {
    environment.systemPackages = with pkgs; [
      grim
      slurp
      wl-clipboard
    ];

    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [

      ];

      programs = {
        swappy.enable = true;
      };
    };
  };
}
