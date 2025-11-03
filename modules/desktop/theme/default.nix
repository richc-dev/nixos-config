{ config, lib, pkgs, ... }:
let
  cfg = config.c-opt.graphical.theme;
in
{
  options.c-opt.graphical.theme = {
    enable = lib.mkEnableOption "Enable graphical theme config, containing fonts";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.hyprcursor
      pkgs.base16-schemes
      cfg.cursor.package
    ] ++ cfg.icons.packages;

    environment.variables = {
      HYPRCURSOR_SIZE = cfg.cursor.size;
      XCURSOR_SIZE = cfg.cursor.size;
      HYPRCURSOR_THEME = cfg.cursor.name;
    };

    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;
      packages = cfg.fonts.packages;
      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ cfg.fonts.monospace ];
          sansSerif = [ cfg.fonts.sansSerif ];
          serif = [ cfg.fonts.serif ];
        };
      };
    };

    qt = {
      enable = true;
      style = "adwaita-dark";
    };

    home-manager.users.${config.c-opt.user.name} = {
      gtk = {
        enable = true;
        colorScheme = cfg.colorScheme;
        theme = {
          name = if cfg.colorScheme == "dark" then "Adwaita-dark" else "Adwaita";
          package = pkgs.gnome-themes-extra;
        };
      };
    };

  };
}
