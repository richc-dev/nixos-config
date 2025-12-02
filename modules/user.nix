# Set up the NixOS user.
{ config, lib, pkgs, ... }:
{
  users = {
    # If this isn't set to false, changing the user password in sops-nix
    # won't update the users password.
    mutableUsers = false;

    users.${config.c-opt.user.name} = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/${config.c-opt.user.name}".path;
      description = config.c-opt.user.fullName;
      extraGroups = [ "networkmanager" "wheel" "daemon" ];
    };
  };

  nix.settings.trusted-users = [ config.c-opt.user.name ];

  environment.variables.EDITOR = config.c-opt.user.defaultEditor;
}