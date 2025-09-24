{ config, lib, ... }:
{
  options.c-opt.terminal.starship.enable = lib.mkEnableOption "Enable Starship";

  config = lib.mkIf config.c-opt.terminal.starship.enable {
    home-manager.users.${config.c-opt.user.name}.programs.starship = {
      enable = true;
      enableFishIntegration = if config.c-opt.terminal.fish.enable then true else false;
    };
  };
}
