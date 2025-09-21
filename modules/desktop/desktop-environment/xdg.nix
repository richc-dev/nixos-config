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
