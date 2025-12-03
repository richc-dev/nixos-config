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
      cfg.cursor.hypr.package
      cfg.cursor.x.package
    ] ++ cfg.icons.packages;

    environment.variables = {
      HYPRCURSOR_SIZE = cfg.cursor.hypr.size;
      XCURSOR_SIZE = cfg.cursor.x.size;
      HYPRCURSOR_THEME = cfg.cursor.hypr.name;
      XCURSOR_THEME = cfg.cursor.x.name;
    };

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

    home-manager.users.${config.c-opt.user.name} =
    { pkgs, ... }:
    {
      systemd.user.tmpfiles.rules = [
        "L /home/${config.c-opt.user.name}/.local/share/icons/${cfg.cursor.hypr.name} - - - - ${cfg.cursor.hypr.package}/share/icons/${cfg.cursor.hypr.name}"
        "L /home/${config.c-opt.user.name}/.local/share/icons/${cfg.cursor.x.name} - - - - ${cfg.cursor.x.package}/share/icons/${cfg.cursor.x.name}"
      ];

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
