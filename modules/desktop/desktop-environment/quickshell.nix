{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.quickshell = {
    enable = lib.mkEnableOption "Quickshell";
  };

  config = lib.mkIf config.c-opt.graphical.quickshell {

    home-manager.users.${config.c-opt.user.name} =
    { ... }:
    {

      programs.quickshell = {
        enable = true;
      };

    };

  };
}
