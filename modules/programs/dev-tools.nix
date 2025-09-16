# Tools I use for web/program development.

{ config, lib, pkgs, ... }:
{
  options.c-opt.dev-tools.enable = lib.mkEnableOption "Development tools";

  config = lib.mkIf config.c-opt.dev-tools.enable {

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        css-html-js-minify
        devenv
        emacs
        godot_4
        netbeans
        php
        python313
        zap
      ];
    };

  };
}
