# Programs for image editing/viewing.

{ config, lib, pkgs, pkgs-stable, ... }:
{
  options.c-opt.programs.image.enable = lib.mkEnableOption "Install image editing/viewing programs";

  config = lib.mkIf config.c-opt.programs.image.enable {
    services.udev = {
      enable = true;
      packages = with pkgs; [ libwacom ];
    };

    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
	      gimp
        inkscape-with-extensions
        nomacs
        krita
      ] ++ [ pkgs-stable.aseprite ];
    };

  };
}
