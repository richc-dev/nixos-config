# Ghostty terminal config.
# https://github.com/ghostty-org/ghostty

{ config, lib, ... }:
let
  graphical-cfg = config.c-opt;
in
{
  config = lib.mkIf cfg.programs.utils.terminal.enable {
    home-manager.users.${cfg.user.name} = {
      programs.ghostty.enable = true;
      stylix.targets.ghostty.enable = lib.mkDefault true;
    };
  };
}
