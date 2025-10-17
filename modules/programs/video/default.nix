# Programs for video editing, recording, and playback.

{ config, lib, pkgs, ... }:
{
  options.c-opt.videoPrograms.enable = lib.mkEnableOption "Install video editing/recording/playback programs";

  config = lib.mkIf config.c-opt.videoPrograms.enable {
    imports = [
      ./davinci-resolve.nix
    ];

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        clapper
        obs-studio
        mpv
        vlc
      ];
    };

  };
}
