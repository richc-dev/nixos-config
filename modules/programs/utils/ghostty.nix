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
        enableFishIntegration = if cfg.programs.utils.terminal.fish.enable then true else false;
        settings = {
          command = "fish";
          confirm-close-surface = false;
          font-size = 10;
          shell-integration = "fish";
          theme = "Wryan";
        };
      };
    };
  };
}
