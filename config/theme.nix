# Define custom theme config.
{ config, lib, pkgs, ... }:
{
  options.c-opt.theme = {
    colorScheme = lib.mkOption {
      type = lib.type.str;
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
        default = "BreezeX-RosePine-Linux";
        description = "Name of the cursor theme.";
      };

      size = lib.mkOption {
        type = lib.types.int;
        default = 24;
        description = "Cursor size.";
      }
    };

    fonts = {
      additionalPkgs = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [
          pkgs.material-symbols
          pkgs.rubik
        ];
        description = "Additional font packages to install.";
      };

      serif = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Dejavu Mono";
          description = "Default serif font.";
        };

        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.dejavu-sans-mono;
          description = "Default serif font package.";
        };
      };

      sansSerif = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Dajavu Mono";
          description = "Default sans-serif font.";
        };

        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.dejavu-sans-mono;
          description = "Default sans-serif font package.";
        };
      };

      monospace = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Dejavu Mono";
          description = "Default monospace font.";
        };

        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.dejavu-sans-mono;
          description = "Default monospace font package.";
        };
      };

      emoji = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "Noto Color Emoji";
          description = "Default emoji font.";
        };

        package = lib.mkOption {
          type = lib.types.package;
          default = pkgs.noto-fonts-color-emoji;
          description = "Default emoji font package.";
        };
      };
    };
  };
}
