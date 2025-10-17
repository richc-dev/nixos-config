{ config, lib, pkgs, sops-nix, ... }:
{
  environment.systemPackages = with pkgs; [
    sops
  ];

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
