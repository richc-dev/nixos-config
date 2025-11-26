{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.programs.audio.mopidy.enable {
    services.mopidy = {
      enable = true;
      extensionPackages = [];
    };
  };
}