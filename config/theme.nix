# Define custom theme config.
{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.theme = {
    # See https://nix-community.github.io/stylix/options/platforms/nixos.html#stylixpolarity
    colorScheme = lib.mkOption {
      type = lib.types.str;
      default = "dark";
      description = "The color scheme for themes. Should be `dark` or `light`.";
    };

    cursor = {
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.rose-pine-hyprcursor;
        description = "Cursor package.";
      };

      name = lib.mkOption {
        type = lib.types.str;
        default = "rose-pine-hyprcursor";#"BreezeX-RosePine-Linux";
        description = "Name of the cursor theme.";
      };

      size = lib.mkOption {
        type = lib.types.ints.unsigned;
        default = 24;
        description = "Cursor size.";
      };
    };

    fonts = {
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [
          pkgs.nerd-fonts.dejavu-sans-mono
          pkgs.rubik
          pkgs.noto-fonts-color-emoji
        ];
        description = "Font packages to install.";
      };

      sizes = {

      };

      serif = lib.mkOption {
        type = lib.types.str;
        default = "DejaVu Mono";
        description = "Default serif font.";
      };

      sansSerif = lib.mkOption {
        type = lib.types.str;
        default = "DajaVu Mono";
        description = "Default sans-serif font.";
      };

      monospace = lib.mkOption {
        type = lib.types.str;
        default = "DejaVu Mono";
        description = "Default monospace font.";
      };

      emoji = lib.mkOption {
        type = lib.types.str;
        default = "DejaVu Mono";
        description = "Default emoji font.";
      };
    };

    icons = {
      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [
          pkgs.papirus-icon-theme
          pkgs.material-symbols
        ];
        description = "Icon packages to install.";
      };

      name = lib.mkOption {
        type = lib.types.str;
        default = "Papirus Dark";
        description = "Icons to use.";
      };

      dark = lib.mkOption {
        type = lib.types.str;
        default = "Papirus Dark";
        description = "Icons to use for dark themes.";
      };

      light = lib.mkOption {
        type = lib.types.str;
        default = "Papirus Light";
        description = "Icons to use for light themes.";
      };
    };

  };

  config = {
    c-opt.graphical.theme = {
      icons.name = if config.c-opt.graphical.theme.colorScheme == "dark"
        then config.c-opt.graphical.theme.icons.dark
        else config.c-opt.graphical.theme.icons.light;
    };
  };
}
