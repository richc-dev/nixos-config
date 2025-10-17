# Programs for audio editing, recording, and playback.

{ config, lib, pkgs, ... }:
{
  options.c-opt.programs.audio.enable = lib.mkEnableOption "Install audio editing/recording/playback programs";

  config = lib.mkIf config.c-opt.programs.audio.enable {

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        audacity
        dopamine
        spotify
      ];
    };

  };
}
