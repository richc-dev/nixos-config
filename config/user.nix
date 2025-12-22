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

      email = lib.mkOption {
        type = lib.types.str;
        default = "rcc@richc.dev";
        description = "User email address";
      };

      gpgKey = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "User GPG key fingerprint";
      };

      defaultEditor = lib.mkOption {
        type = lib.types.str;
	      default = "nvim";
	      description = "User default editor";
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
