{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.programs.programming.emacs.enable {
    services.emacs = {
      enable = true;
    };
  };
}