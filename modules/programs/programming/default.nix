# Tools I use for web/program development.

{ config, lib, pkgs, ... }:
{
  imports = [
    ./emacs.nix
    ./vscodium.nix
  ];

  config = lib.mkIf config.c-opt.programs.programming.enable {
    programs.direnv.enable = true;

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        css-html-js-minify
        devenv
        godot_4
	libgcc
        netbeans
        php
        php84Packages.composer
        python313
        zap
      ];
    };

  };
}
