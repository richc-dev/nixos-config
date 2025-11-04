# Ghostty terminal config.
# https://github.com/ghostty-org/ghostty

{ config, lib, ... }:
let
  cfg = config.c-opt;
in
{
  config = lib.mkIf cfg.programs.utils.terminal.enable {
    home-manager.users.${cfg.user.name} = {
      programs.ghostty = {
        enable = true;
        enableFishIntegration = cfg.programs.utils.terminal.fish.enable;
        settings = {
          theme = "Wryan";
          font-size = 10;
        };
      };
    };
  };
}
