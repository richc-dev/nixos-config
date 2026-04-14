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
        godot
        python313
        zap
      ];

      programs = {
        neovim = {
	        enable = true;
	        withRuby = false;
	        withPython3 = false;
	      };

        zed-editor = {
          enable = true;
          extensions = [ "haskell" "html" "nix" "php" "zig" ];
          userSettings = {
            helix_mode = true;
            vim_mode = false;
            telemetry = {
              diagnostics = false;
              metrics = false;
            };
            base_keymap = "VSCode";
            theme = {
              mode = "dark";
              dark = "Ayu Dark";
            };
          };
        };
      };
    };

  };
}
