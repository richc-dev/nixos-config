# Kitty terminal config.
# https://github.com/kovidgoyal/kitty

{ config, lib, ... }:
let
  graphical-cfg = config.c-opt;
in
{
  config = lib.mkIf cfg.programs.utils.terminal.enable {
    home-manager.users.${cfg.user.name} = {
      programs.kitty = {
        enable = true;
        font = {
          name = graphical-cfg.theme.fonts.monospace.name;
          size = 10;
        };
        settings = {
          confirm_os_window_close = 0;
          shell = if cfg.programs.utils.terminal.fish.enable then "fish" else ".";
        };
      };
    };
  };
}
