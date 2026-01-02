# Define custom theme config.
{ config, lib, pkgs, ... }:
{
  options.c-opt.theme = {
    # See https://nix-community.github.io/stylix/options/platforms/nixos.html#stylixpolarity
    colorScheme = lib.mkOption {
      type = lib.types.str;
      default = "dark";
      description = "The color scheme for themes Should be `dark` or `light`";
    };

    themeFile = lib.mkOption {
      type = lib.types.path;
      default = ./configs/wryan.yaml;
      description = "Theme yaml file";
    };

    cursor = {
      hypr = {
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.rose-pine-hyprcursor;
          description = "Cursor package";
        };

        name = lib.mkOption {
          type = lib.types.str;
          default = "rose-pine-hyprcursor";
          description = "Name of the cursor theme";
        };

        size = lib.mkOption {
          type = lib.types.ints.unsigned;
          default = 24;
          description = "Cursor size";
        };
      };

      x = {
        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.rose-pine-cursor;
          description = "Cursor package";
        };

        name = lib.mkOption {
          type = lib.types.str;
          default = "BreezeX-RosePine-Linux";
          description = "Name of the cursor theme";
        };

        size = lib.mkOption {
          type = lib.types.ints.unsigned;
          default = 24;
          description = "Cursor size";
        };
      };
    };

    fonts = {
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [
          pkgs.courier-prime
          pkgs.liberation_ttf
          pkgs.maple-mono.Normal-NF
          pkgs.nerd-fonts.dejavu-sans-mono
          pkgs.noto-fonts-color-emoji
	        pkgs.nerd-fonts.symbols-only
          pkgs.rubik
        ];
        description = "Font packages to install";
      };

      sizes = {

      };

      serif = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Rubik";
          description = "Default serif font";
        };

        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.rubik;
          description = "Default serif font package";
        };
      };

      sansSerif = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Rubik";
          description = "Default sans-serif font";
        };

        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.rubik;
          description = "Default sans-serif font package";
        };
      };

      monospace = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Maple Mono Normal NF";
          description = "Default monospace font";
        };

        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.maple-mono.NF;
          description = "Default monospace font package";
        };
      };

      emoji = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "DejaVu Mono";
          description = "Default emoji font";
        };

        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.nerd-fonts.dejavu-sans-mono;
          description = "Default emoji font package";
        };
      };
    };

    icons = {
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [
          pkgs.papirus-icon-theme
          pkgs.material-symbols
        ];
        description = "Icon packages to install";
      };

      name = lib.mkOption {
        type = lib.types.str;
        default = "Papirus Dark";
        description = "Icons to use";
      };

      dark = lib.mkOption {
        type = lib.types.str;
        default = "Papirus Dark";
        description = "Icons to use for dark themes";
      };

      light = lib.mkOption {
        type = lib.types.str;
        default = "Papirus Light";
        description = "Icons to use for light themes";
      };
    };

  };

  config = {
    c-opt.theme = {
      icons.name = if config.c-opt.theme.colorScheme == "dark"
        then config.c-opt.theme.icons.dark
        else config.c-opt.theme.icons.light;
    };
  };
}
