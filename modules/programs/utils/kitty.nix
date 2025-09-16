# Kitty terminal config.
# https://github.com/kovidgoyal/kitty

{ config, ... }:
{
  config = {
    home-manager.users.${config.c-opt.user.name} = {
      programs.kitty = {
        enable = true;
      };
    };
  };
}
