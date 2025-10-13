{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.theme = {
    enable = lib.mkEnableOption "Enable graphical theme config, containing fonts";
  };

  config = lib.mkIf config.c-opt.graphical.theme.enable {
    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;
      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ config.c-opt.font ];
          sansSerif = [ config.c-opt.font ];
          serif = [ config.c-opt.font ];
        };
      };
      packages = with pkgs; [
        nerd-fonts.dejavu-sans-mono
        rubik
        material-symbols
      ];
    };

    home-manager.users.${config.c-opt.user.name} = {
      # GTK theme.
      gtk = {
        enable = true;
        colorScheme = "dark";
        theme = {
          name = "Adwaita-dark";
          package = pkgs.gnome-themes-extra;
        };
      };

      # Qt theme.
      qt = {
        enable = true;
        platformTheme.name = "kvantum";
        style.name = "kvantum";
      };
    };

  };
}
