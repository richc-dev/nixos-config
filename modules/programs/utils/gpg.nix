{ config, lib, pkgs, ... }:
{
  config = {

    home-manager.users.${config.c-opt.user.name} = {
      programs.gpg = {
        enable = true;
      };

      services.gpg-agent = {
        enable = true;
        enableSshSupport = true;
        pinentryPackage = pkgs.pinentry-qt;
      };
    };

  };
}
