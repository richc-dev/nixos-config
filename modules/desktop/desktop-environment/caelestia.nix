{ config, lib, caelestia-shell, system, ... }:
{
  options.c-opt.graphical.caelestia = {
    enable = lib.mkEnableOption "Caelestia Quickshell dots";
  };

  config = lib.mkIf config.c-opt.graphical.caelestia.enable {
    home-manager.users.${config.c-opt.user.name} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          caelestia-shell
          caelestia-cli
        ];

      };
  };
}
