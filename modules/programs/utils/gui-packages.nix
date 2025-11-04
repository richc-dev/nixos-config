# Enable miscellaneous gui utilities.

{ config, lib, pkgs, ... }:
{
  options.c-opt.programs.utils.gui.enable = lib.mkEnableOption "Enable GUI Utilities";

  config = lib.mkIf config.c-opt.programs.utils.gui.enable {
    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [
        kdePackages.ark
        kdePackages.dolphin
        kdePackages.dolphin-plugins
        ghostty
        overskride # Bluetooth manager
      ];

      programs = {

      };
    };
  };
}
