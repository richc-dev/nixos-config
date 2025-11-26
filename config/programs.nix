# Defines custom config options relating to installed programs.

{ config, lib, ... }:
{
  options.c-opt.programs = {
    audio = {
      enable = lib.mkEnableOption "Install audio editing/recording/playback programs";
      mpd.enable = lib.mkEnableOption "Enable Mopidy";
    };
    gaming.enable = lib.mkEnableOption "Enable gaming related programs";
  };

  config.c-opt.programs = {
    gaming.enable = lib.mkDefault true;
    audio = {
      enable = lib.mkDefault true;
      mpd.enable = lib.mkDefault true;
    };
  };
}
