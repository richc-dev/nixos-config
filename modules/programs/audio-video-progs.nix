# Tools for working with images, audio, and videos.

{ config, lib, pkgs, ... }:
{
  options.c-opt.audio-video-progs.enable = lib.mkEnableOption "Audio/video/image editors/players";

  config = lib.mkIf config.c-opt.audio-video-progs.enable {

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        aseprite
        audacity
        dopamine
        inkscape-with-extensions
        krita
        spotify
        vlc
      ];
    };

  };
}
