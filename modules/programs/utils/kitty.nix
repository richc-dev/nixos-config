# Kitty terminal config.
# https://github.com/kovidgoyal/kitty

{ config, ... }:
{
  config = {
    home-manager.users.${config.c-opt.user.name} = {
      programs.kitty = {
        enable = true;
        font = {
          name = config.c-opt.font;
          size = 10;
        };
        settings = {
          confirm_os_window_close = 0;
        };
      };
    };
  };
}
