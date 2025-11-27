{ config, lib, pkgs, ... }:
let
  cfg = config.c-opt;
in
{
  options.c-opt.programs.utils.terminal.fish.enable = lib.mkEnableOption "Enable fish";

  config = lib.mkIf cfg.programs.utils.terminal.fish.enable {
    programs.fish = {
      enable = true;
      shellInit = ''
        set fish_greeting # Disable greeting
        starship init fish | source
      '';
    };
  };
}
