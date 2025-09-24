{ config, lib, ... }:
{
  options.c-opt.graphical.hyprpaper.enable = lib.mkEnableOption "Hyperpaper";

  config = lib.mkIf config.c-opt.graphical.hyprpaper.enable {
    home-manager.users.${config.c-opt.user.name}.services.hyperpaper = {
      enable = true;
      settings = {
        ipc = "on";
      };
    };
  };
}
