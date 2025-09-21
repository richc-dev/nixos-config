# Defines custom config options for the operating system so
# they don't need to be defined in the flake and passed
# with `specialArgs`.

{ config, lib, ... }:
{
  options = {
    c-opt.stateVersion = lib.mkOption {
      type = lib.types.str;
      example = "25.11";
      description = "NixOS state version.";
    };

    c-opt.timeZone = lib.mkOption {
      type = lib.types.str;
      default = "America/Chicago";
      description = "System timezone.";
    };

    c-opt.laptop = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether the device is a laptop. Enables power saving features.";
    };

    # If you are going to change this option, make sure to add your font in
    # `nixos-config/modules/desktop/theme/default.nix` under `fonts.packages`!
    c-opt.font = lib.mkOption {
      type = lib.types.str;
      default = "DejaVu Mono";
      description = "The system font.";
    };

    c-opt.persistence = {
      enable = lib.mkEnableOption "Enable persistence/impermanence";
    };
  };

  config = {
    c-opt.persistence.enable = lib.mkDefault false;
  };
}
