{ config, lib, pkgs, ... }:
{
  options.c-opt.de.xdg.enable = lib.mkEnableOption "Enable xdg";

  config = lib.mkIf config.c-opt.de.xdg.enable {
    environment.systemPackages = with pkgs; [
      xdg-user-dirs
      xdg-utils
      libsForQt5.kservice
    ];

    xdg = {
      portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
      };
      mime = {
        enable = true;
        defaultApplications = {
          "image/png" = "nomacs.desktop";
          "image/jpeg" = "nomacs.desktop";
          "image/svg+xml" = "inkscape.desktop";
          "text/plain" = "nvim.desktop";
          "text/html" = "librewolf.desktop";
          "video/mp4" = "mpv.desktop";
          "video/mkv" = "mpv.desktop";
          "x-scheme-handler/http" = "librewolf.desktop";
          "x-scheme-handler/https" = "librewolf.desktop";
          "x-scheme-handler/about" = "librewolf.desktop";
          "x-scheme-handler/unknown" = "librewolf.desktop";
        };
      };
    };

    home-manager.users.${config.c-opt.user.name}.xdg = {
      enable = true;
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
}
