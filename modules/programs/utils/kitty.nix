# Kitty terminal config.
# https://github.com/kovidgoyal/kitty

{ config, lib, ... }:
let
  graphical-cfg = config.c-opt.graphical.theme;
in
{
  options.c-opt.programs.utils.terminal.enable = lib.mkEnableOption "Enable Kitty";

  config = lib.mkIf config.c-opt.programs.utils.terminal.enable {
    home-manager.users.${config.c-opt.user.name} = {
      programs.kitty = {
        enable = true;
        font = {
          name = graphical-cfg.fonts.monospace;
          size = 10;
        };
        settings = {
          confirm_os_window_close = 0;
          shell = if config.c-opt.programs.utils.terminal.fish.enable then "fish" else ".";
        };
      };
    };
  };
}
