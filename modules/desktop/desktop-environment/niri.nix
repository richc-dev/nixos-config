{ config, lib, pkgs, ... }:
{
  options.c-opt.de.niri.enable = lib.mkEnableOption "Enable Niri compositor";

  config = lib.mkIf config.c-opt.de.niri.enable {
    programs.niri.enable = true;

    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite # xwayland support
      mako
    ];

    xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];

    home-manager.users.${config.c-opt.user.name}.xdg.configFile."niri/config.kdl".source = ./configs/niri/config.kdl;
  };
}
