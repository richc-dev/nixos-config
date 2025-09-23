{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.xdg.enable = lib.mkEnableOption "xdg";

  config = {

    xdg.portal = {
      enable = true;
      wlr.enable = true;
    };

    home-manager.users.${config.c-opt.user.name} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          xdg-user-dirs
          xdg-utils
        ];

        xdg = {
          enable = true;
          mimeApps = {
            enable = true;
            defaultApplications = {
              "text/html" = "librewolf.desktop";
              "x-scheme-handler/http" = "librewolf.desktop";
              "x-scheme-handler/https" = "librewolf.desktop";
              "x-scheme-handler/about" = "librewolf.desktop";
              "x-scheme-handler/unknown" = "librewolf.desktop";
            };
          };
          userDirs = {
            enable = true;
            desktop = "$HOME/desktop";
            documents = "$HOME/documents";
            download = "$HOME/downloads";
            music = "$HOME/music";
            pictures = "$HOME/music";
            publicShare = "$HOME/desktop";
            templates = "$HOME/public";
            videos = "$HOME/videos";
          };
        };
      };

  };
}
