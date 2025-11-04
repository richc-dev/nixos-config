# Fuzzel config.
# https://codeberg.org/dnkl/fuzzel

{ config, lib, pkgs, ... }:
let
  cfg = config.c-opt.theme;
in
{
  options.c-opt.graphical.fuzzel.enable = lib.mkEnableOption "fuzzel";

  config = lib.mkIf config.c-opt.graphical.fuzzel.enable {

    home-manager.users.${config.c-opt.user.name} = {
      programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            terminal = "${pkgs.kitty}/bin/kitty";
            layer = "overlay";
            icon-theme = cfg.icons.name;
            prompt = " ";
            font = "${cfg.fonts.serif.name}";
          };
          colors = {
            background = "1b1b1bdd";
            text = "b7b7b7ff";
            selection = "707070ff";
            selection-text = "e8e8e8ff";
            border = "e8e8e8ff";
            match = "ffffffff";
            selection-match = "ffffffff";
          };
          border = {
            radius = "10";
            width = "1";
          };
          dmenu = {
            exit-immediately-if-empty = "yes";
          };
        };
      };
    };

  };
}
