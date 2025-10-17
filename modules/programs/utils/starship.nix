{ config, lib, ... }:
{
  options.c-opt.programs.utils.terminal.starship.enable = lib.mkEnableOption "Enable Starship";

  config = lib.mkIf config.c-opt.programs.utils.terminal.starship.enable {
    home-manager.users.${config.c-opt.user.name}.programs.starship = {
      enable = true;
      enableFishIntegration = if config.c-opt.programs.utils.terminal.fish.enable then true else false;
    };
  };
}
