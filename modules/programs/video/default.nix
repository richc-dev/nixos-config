# Programs for video editing, recording, and playback.

{ config, lib, pkgs, ... }:
{
  imports = [
    ./davinci-resolve.nix
  ];

  options.c-opt.programs.video.enable = lib.mkEnableOption "Install video editing/recording/playback programs";

  config = lib.mkIf config.c-opt.programs.video.enable {
    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [
        obs-studio
      ];

      programs.mpv = {
        enable = true;
        config = {
          volume-max = 300;
        };
      };
    };

  };
}
