{ config, lib, pkgs, ... }:
let
  cfg = config.c-opt.theme;
in
{
  options.c-opt.theme.enable = lib.mkEnableOption "Enable theme config";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.hyprcursor
      pkgs.base16-schemes
      cfg.cursor.package
    ] ++ cfg.icons.packages;

    stylix = {
      enable = true;
      autoEnable = false;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal.yaml";
      polarity = cfg.colorScheme;

      cursor = cfg.cursor;
    };

    # environment.variables = {
    #   HYPRCURSOR_SIZE = cfg.cursor.size;
    #   XCURSOR_SIZE = cfg.cursor.size;
    #   HYPRCURSOR_THEME = cfg.cursor.name;
    # };

    fonts = {
      enableDefaultPackages = true;
      fontDir.enable = true;
      packages = cfg.fonts.packages;
      fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = [ cfg.fonts.monospace.name ];
          sansSerif = [ cfg.fonts.sansSerif.name ];
          serif = [ cfg.fonts.serif.name ];
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
