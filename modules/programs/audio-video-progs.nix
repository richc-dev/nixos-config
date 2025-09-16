# Tools for working with images, audio, and videos.

{
  options.c-opt.audio-video-progs.enable = lib.mkEnableOption "Audio/video/image editors/players";

  config = lib.mkIf config.c-opt.audio-video-progs.enable {

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        aseprite
        audacity
        dopamine
        inkscape-with-extensions
        kirta
        spotify
        vlc
      ];
    };

  };
}
