# Defines custom config options for the operating system.

{ config, lib, ... }:
{
  options.c-opt = {
    stateVersion = lib.mkOption {
      type = lib.types.str;
      example = "25.11";
      description = "NixOS state version.";
    };

    timeZone = lib.mkOption {
      type = lib.types.str;
      default = "America/Chicago";
      description = "System timezone.";
    };

    laptop = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether the device is a laptop. Enables power saving features.";
    };
  };
}
