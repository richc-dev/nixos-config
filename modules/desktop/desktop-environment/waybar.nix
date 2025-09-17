{ config, lib, ... }:
{
  options.c-opt.graphical.waybar = {
    enable = lib.mkEnableOption "Waybar";
  };

  config = lib.mkIf config.c-opt.graphical.waybar.enable {

    home-manager.users.${config.c-opt.user.name} =
    { pkgs, ... }:
    {
      programs.waybar = {
        enable = true;
        systemd.enable = true;

#         settings = [
#
#         ];

#         style = ''
#
#         '';
      };

    };

  };
}
