# Defines custom config options for users.

{ config, lib, pkgs, ... }:
{
  options = {
    c-opt.user = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "rcc";
        description = "Primary user name.";
      };

      fullName = lib.mkOption {
        type = lib.types.str;
        default = "Richie C.";
        description = "User full name.";
      };

      gpgKey = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "User GPG key.";
      };

      homeDirectory = lib.mkOption {
        type = lib.types.str;
        description = "User home directory.";
      };
    };
  };

  config = {
    c-opt.user.homeDirectory = lib.mkDefault "/home/${config.c-opt.user.name}";
  };
}
