# Programs for image editing/viewing.

{ config, lib, pkgs, ... }:
{
  options.c-opt.imagePrograms.enable = lib.mkEnableOption "Install image editing/viewing programs";

  config = lib.mkIf config.c-opt.imagePrograms.enable {

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        aseprite
        inkscape-with-extensions
        nomacs
        krita
      ];
    };

  };
}
