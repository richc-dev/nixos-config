{ config, ... }:
{
  imports = [
    ./${config.c-opt.user.name}/nixos.nix
  ];

  # Set up the user.
  users.users.${config.c-opt.user.name} = {
    isNormalUser = true;
    description = config.c-opt.user.fullName;
    extraGroups = [ "networkmanager" "wheel" "daemon" ];
  };

  nix.settings.trusted-users = [ config.c-opt.user.name ];
}
