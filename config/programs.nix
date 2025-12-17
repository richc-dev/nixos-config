# Defines custom config options relating to installed programs.

{ config, lib, ... }:
{
  options.c-opt.programs = {
    audio = {
      enable = lib.mkEnableOption "Install audio editing/recording/playback programs";
      mpd.enable = lib.mkEnableOption "Enable mpd";
    };
    docker.enable = lib.mkEnableOption "Enable docker";
    gaming.enable = lib.mkEnableOption "Enable gaming related programs";
    programming = {
      enable = lib.mkEnableOption "Enable programming related tools/apps";
    };
    utils = {
      enable = lib.mkEnableOption "Enable system utilities";
      duplicity.enable = lib.mkEnableOption "Enable duplicity (backups)";
      ghostty.enable = lib.mkEnableOption "Enable ghostty";
    };
    video = {
      enable = lib.mkEnableOption "Enable video related programs";
      davinciResolve.enable = lib.mkEnableOption "Enable DavinciResolve";
    };
  };

  config.c-opt.programs = {
    audio = {
      enable = lib.mkDefault true;
      mpd.enable = lib.mkDefault true;
    };
    docker.enable = lib.mkDefault true;
    gaming.enable = lib.mkDefault true;
    programming = {
      enable = lib.mkDefault true;
    };
    utils = {
      enable = lib.mkDefault true;
      duplicity.enable = lib.mkDefault false;
      ghostty.enable = lib.mkDefault true;
    };
    video = {
      enable = lib.mkDefault true;
      davinciResolve.enable = lib.mkDefault false;
    };
  };
}
