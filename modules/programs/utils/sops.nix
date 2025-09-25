{ config, lib, pkgs, sops-nix, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/${config.c-opt.user.name}/.config/sops/age/keys.txt";

    secrets = {
      "users/root" = {
        neededForUsers = true;
      };
      "users/rcc" = {
        neededForUsers = true;
      };
    };
  };

}
