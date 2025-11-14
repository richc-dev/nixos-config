# Defines custom config options relating to installed programs.

{ config, lib, ... }:
{
  options.c-opt.programs = {
    gaming.enable = lib.mkEnableOption "Enable gaming related programs";
  };

  config.c-opt.programs = {
    gaming.enable = lib.mkDefault true;
  };
}
