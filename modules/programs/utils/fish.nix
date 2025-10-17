{ config, lib, pkgs, ... }:
{
  options.c-opt.programs.utils.terminal.fish.enable = lib.mkEnableOption "Enable fish";

  config = lib.mkIf config.c-opt.programs.utils.terminal.fish.enable {
    home-manager.users.${config.c-opt.user.name}.programs.fish = {
        enable = true;
    };
  };
}
