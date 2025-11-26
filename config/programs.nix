# Defines custom config options relating to installed programs.

{ config, lib, ... }:
{
  options.c-opt.programs = {
    audio = {
      enable = lib.mkEnableOption "Install audio editing/recording/playback programs";
      mopidy.enable = lib.mkEnableOption "Enable Mopidy";
    };
    gaming.enable = lib.mkEnableOption "Enable gaming related programs";
  };

  config.c-opt.programs = {
    gaming.enable = lib.mkDefault true;
    audio = {
      enable = lib.mkDefault true;
      mopidy.enable = lib.mkDefault true;
    };
  };
}
