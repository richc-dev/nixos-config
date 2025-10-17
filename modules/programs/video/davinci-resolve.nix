# Install Davinci Resolve.
# https://www.blackmagicdesign.com/products/davinciresolve

{ config, lib, pkgs, ... }:
{
  options.c-opt.videoPrograms.davinciResolve.enable = lib.mkEnableOption "Install Davinci Resolve";

  config = lib.mkIf config.c-opt.video.davinciResolve.enable {

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        davinci-resolve
      ];
    };

  };
}
