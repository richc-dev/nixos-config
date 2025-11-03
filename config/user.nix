# Defines custom config options for users.

{ config, lib, pkgs, ... }:
{
  options.c-opt = {
    user = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "rcc";
        description = "User username";
      };

      fullName = lib.mkOption {
        type = lib.types.str;
        default = "Richie C.";
        description = "User full name";
      };

      gpgKey = lib.mkOption {
        type = lib.types.str;
        default = "DCD23EA671ECFA94443A0022C1C9C7BCDF81D9BC";
        description = "User GPG key fingerprint";
      };

      homeDirectory = lib.mkOption {
        type = lib.types.str;
        description = "User home directory";
      };
    };
  };

  config = {
    c-opt.user.homeDirectory = lib.mkDefault "/home/${config.c-opt.user.name}";
  };
}
