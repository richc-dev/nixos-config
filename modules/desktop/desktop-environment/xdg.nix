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
          autostart.enable = true;
          mimeApps = {
            enable = true;
            defaultApplications = {
              "text/html" = "librewolf.desktop";
              "video/mp4" = "mpv.desktop";
              "video/mkv" = "mpv.desktop";
              "x-scheme-handler/http" = "librewolf.desktop";
              "x-scheme-handler/https" = "librewolf.desktop";
              "x-scheme-handler/about" = "librewolf.desktop";
              "x-scheme-handler/unknown" = "librewolf.desktop";
            };
          };
          userDirs = {
            enable = true;
            desktop = "$HOME/Desktop";
            documents = "$HOME/Documents";
            download = "$HOME/Downloads";
            music = "$HOME/Music";
            pictures = "$HOME/Pictures";
            publicShare = "$HOME/Public";
            templates = "$HOME/Templates";
            videos = "$HOME/Videos";
          };
        };
      };

  };
}
