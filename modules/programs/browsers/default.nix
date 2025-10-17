{ config, lib, pkgs, ... }:
{
  imports = [
    ./librewolf.nix
  ];

  options.c-opt.programs.browsers.enable = lib.mkEnableOption "Browsers";

  config = lib.mkIf config.c-opt.programs.browsers.enable {
    home-manager.users.${config.c-opt.user.name} = {

      home.packages = with pkgs; [
        tor-browser
      ];

      programs = {

        # Install Brave
        chromium = {
          enable = true;
          package = pkgs.brave;
        };

      };

    };
  };
}
