# Install Davinci Resolve.
# https://www.blackmagicdesign.com/products/davinciresolve

{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.programs.video.davinciResolve.enable {

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        davinci-resolve
      ];
    };

  };
}
