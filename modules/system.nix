{ config, lib, pkgs, ... }:
{
  nix = {
    settings = {
      # Enable flakes.
      experimental-features = [ "nix-command" "flakes" ];

      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };

    # Weekly garbage collection and store
    # optimization to help with storage space.
    # https://wiki.nixos.org/wiki/Storage_optimization
    gc = {
        automatic = lib.mkDefault true;
        dates = lib.mkDefault "weekly";
        options = lib.mkDefault "--delete-older-than 7d";
    };

    optimise = {
        automatic = lib.mkDefault true;
        dates =  lib.mkDefault [ "03:45" ];
    };
  };

  # Set up bootloader.
  boot.loader = {
    systemd-boot.enable = lib.mkDefault true;
    efi.canTouchEfiVariables = lib.mkDefault true;
  };

  # Set device timezone.
  time.timeZone = "America/Chicago";

  security = {
    polkit.enable = true;
  };

  networking = {
    # Enable networking.
    networkmanager.enable = lib.mkDefault true;

    # Enable firewall.
    firewall = {
      enable = lib.mkDefault true;
      # allowedTCPPorts = [];
      # allowedUDPPorts = [];
    };
  };

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  services = {
    # Enable CUPS to print documents.
    printing.enable = lib.mkDefault true;
  };

  # Set up the user.
  users = {
    mutableUsers = false;

    users.${config.c-opt.user.name} = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/${config.c-opt.user.name}".path;
      description = config.c-opt.user.fullName;
      extraGroups = [ "networkmanager" "wheel" "daemon" ];
    };
  };

  nix.settings.trusted-users = [ config.c-opt.user.name ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = config.c-opt.stateVersion; # Did you read the comment?
}
