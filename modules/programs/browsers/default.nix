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
        qutebrowser = {
          enable = true;
          settings = {
            colors.webpage.preferred_color_scheme = "dark";
          };
        };

        # Install Brave
        chromium = {
          enable = true;
          package = pkgs.brave;
        };

      };

    };
  };
}
