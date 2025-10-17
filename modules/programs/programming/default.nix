# Tools I use for web/program development.

{ config, lib, pkgs, ... }:
{
  imports = [
    ./vscodium.nix
  ];

  options.c-opt.programs.programming.enable = lib.mkEnableOption "Development tools";

  config = lib.mkIf config.c-opt.programs.programming.enable {
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
