# Impermanence config.
# https://github.com/nix-community/impermanence

{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.impermanence.enable {

  }
}
