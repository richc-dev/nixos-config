# Fuzzel config.
# https://codeberg.org/dnkl/fuzzel

{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.fuzzel.enable = lib.mkEnableOption "fuzzel";

  config = lib.mkIf config.c-opt.graphical.fuzzel.enable {

    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [ papirus-icon-theme ];

      programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            terminal = "${pkgs.kitty}/bin/kitty";
            layer = "overlay";
            icon-theme = "Papirus-Dark";
            prompt = " ";
            font = "${config.c-opt.font}";
          };
          colors = {
            background = "1b1b1bdd";
            text = "e8e8e8ff";
            selection = "707070ff";
            selection-text = "b7b7b7ff";
            border = "e8e8e8ff";
            match = "ed8796ff";
            selection-match = "ed8796ff";
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
