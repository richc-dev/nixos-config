{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.programs.audio.mpd.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "$XDG_MUSIC_DIR";
      startWhenNeeded = true;
    };
  };
}