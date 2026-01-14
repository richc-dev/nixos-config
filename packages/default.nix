{ config, lib, pkgs, ... }:
{
  options.c-pkgs = {
    repeater = lib.mkOption {
      type = lib.types.package;
      default = pkgs.callPackage ./repeater.nix {};
    };
  };
}
