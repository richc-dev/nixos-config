{ config, lib, pkgs, ... }:
let
  cfg = config.c-opt;
in
{
  options.c-opt.programs.utils.terminal.fish.enable = lib.mkEnableOption "Enable fish";

  config = lib.mkIf cfg.programs.utils.terminal.fish.enable {
    home-manager.users.${cfg.user.name} = {
      programs.fish = {
        enable = true;
      };
    };
  };
}
