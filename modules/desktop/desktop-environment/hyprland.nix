{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.hyprland = {
    enable = lib.mkEnableOption "hyprland wm";
  };

  config = lib.mkIf config.c-opt.graphical.hyprland.enable {

    # Install some useful Wayland utilities.
    environment.systemPackages = with pkgs; [
      grim
      slurp
      wl-clipboard
    ];

    # Set up cache for Hyprland.
    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    services = {
      # Load Nvidia driver
      xserver.videoDrivers = [ "nvidia" "amdgpu" ];

      # Load sddm
      displayManager.sddm = {
          enable = true;
          package = pkgs.kdePackages.sddm;
          wayland.enable = true;
          extraPackages = with pkgs.kdePackages; [
            qtsvg
            qtvirtualkeyboard
          ];
      };
    };

    home-manager.users.${config.c-opt.user.name} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          kdePackages.plasma5support
          qt5.qtwayland
          qt6.qtwayland
        ];

        services.cliphist.enable = true;

        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;

#           settings = {
#
#             "$terminal" = "kitty";
#             "$mod" = "SUPER";
#
#             env = [
#               "NIXOS_OZONE_WL,1"
#             ];
#             exec-once = [
#               "$terminal"
#               "waybar"
#             ];
#
#             systemd.enable = true;
#
#           };
        };

      };

  };
}
