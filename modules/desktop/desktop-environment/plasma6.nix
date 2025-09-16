{ config, lib, pkgs, ... }:
{
  options.c-opt.plasma.enable = lib.mkEnableOption "Plasma 6 Desktop Environment";

  config = lib.mkIf config.c-opt.plasma.enable {
    # Plasma6 related options.
    services = {
      desktopManager.plasma.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # Enable Ozone for Wayland support on Chromium and Electron apps
    environment.sessionVariables.NIXOS_OZONE_WL = lib.mkDefault "1";

    environment.systemPackages = with pkgs; [
      kdePackages.qtwebengine

      # Fonts
      corefonts
      vista-fonts
    ];
  };
}
