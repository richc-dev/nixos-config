{ config, lib, pkgs, ... }:
{
  nix = {
    # Enable flakes.
    settings.experimental-features = [ "nix-command" "flakes" ];

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
    efi.canTouchVariables = lib.mkDefault true;
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

  environment.systemPackages = with pkgs; [
    git
    gparted
    wget
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = config.c-opt.stateVersion; # Did you read the comment?
}
