# Defines custom config options relating to installed programs.

{ config, lib, ... }:
{
  options.c-opt.programs = {
    audio = {
      enable = lib.mkEnableOption "Install audio editing/recording/playback programs";
      mpd.enable = lib.mkEnableOption "Enable Mopidy";
    };
    gaming.enable = lib.mkEnableOption "Enable gaming related programs";
    programming = {
      enable = lib.mkEnableOption "Enable programming related tools/apps";
    };
    utils = {
      enable = lib.mkEnableOption "Enable system utilities";
      ghostty.enable = lib.mkEnableOption "Enable ghostty";
    };
  };

  config.c-opt.programs = {
    audio = {
      enable = lib.mkDefault true;
      mpd.enable = lib.mkDefault true;
    };
    gaming.enable = lib.mkDefault true;
    programming = {
      enable = lib.mkDefault true;
    };
    utils = {
      enable = lib.mkDefault true;
      ghostty.enable = lib.mkDefault true;
    };
  };
}
