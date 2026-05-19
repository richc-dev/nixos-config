# Tools I use for web/program development.

{ config, lib, pkgs, ... }:
{
  imports = [
    ./vscodium.nix
  ];

  config = lib.mkIf config.c-opt.programs.programming.enable {
    programs.direnv.enable = true;

    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [
        css-html-js-minify
        multimarkdown

        devenv
        emacs
        flow-control
        godot
        nixd
        python313
        zap
      ];

      programs = {
        neovim = {
	        enable = true;
	        withRuby = false;
          withPython3 = false;
	      };

        helix = {
          enable = true;
          defaultEditor = true;
          settings = {
            theme = "ayu_evolve";
            editor = {
              cursor-shape = {
                insert = "bar";
                normal = "block";
                select = "underline";
              };
              cursorline = true;
              whitespace.render = "all";
              indent-guides.render = true;
              line-number = "relative";
              rulers = [100];
            };
          };
        };
      };
    };
  };
}
