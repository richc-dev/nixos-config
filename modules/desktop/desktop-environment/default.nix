{ config, lib, ... }:
{
  imports = [
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./niri.nix
    ./noctalia.nix
    ./sddm.nix
    ./quickshell.nix
    ./xdg.nix
  ];

  config = lib.mkIf config.c-opt.de.enable {
    home-manager.users.${config.c-opt.user.name} = {
      services.hyprpolkitagent.enable = true;
    };
  };
}
