# Defines config options for impermanence.

{ config, lib, ... }:
{
  options = {
    c-opt.impermanence = {
      enable = lib.mkEnableOption "Enable impermanence";

      persistentFolders = lib.mkOption {
        type = lib.types.listOf str;
        default = [];
        description = "A list of directories to keep after rebooting.";
      };
    };
  };
}
