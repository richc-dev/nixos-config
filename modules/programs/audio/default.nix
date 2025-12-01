# Programs for audio editing, recording, and playback.

{ config, lib, pkgs, ... }:
{
  imports = [
    ./mpd.nix
  ];

  config = lib.mkIf config.c-opt.programs.audio.enable {

    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [
        audacity
        dopamine
        spotify
      ];

      programs.rmpc = {
        enable = true;
      };

      services = {
        playerctld.enable = true;
      };
    };

  };
}
