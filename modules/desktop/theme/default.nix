{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.theme = {
    enable = lib.mkEnableOption "Enable graphical theme config, containing fonts";
  };

  config = lib.mkIf config.c-opt.graphical.theme.enable {
    environment.systemPackages = [
      pkgs.hyprcursor
      # pkgs.rose-pine-hyprcursor
    ];

    stylix = {
      enable = true;
      # polarity = config.c-opt.theme.colorScheme;
      # Cursor settings
      cursor = config.c-opt.theme.cursor;
      # Fonts
      fonts = config.c-opt.theme.fonts;
    };

    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;
      # fontconfig = {
      #   enable = true;
      #   defaultFonts = {
      #     monospace = [ config.c-opt.font ];
      #     sansSerif = [ config.c-opt.font ];
      #     serif = [ config.c-opt.font ];
      #   };
      # };
      packages = config.c-opt.theme.fonts.additionalPkgs;
    };

    qt = {
      enable = true;
      style = "adwaita-dark";
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
        platformTheme.name = "adwaita-dark";
        style.name = "adwaita-dark";
      };
    };

  };
}
