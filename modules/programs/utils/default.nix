# Enable miscellaneous utilities.

{ config, lib, pkgs, ... }:
{
  imports = [
    ./duplicity.nix
    ./fish.nix
    ./ghostty.nix
    ./git.nix
    ./gpg.nix
    ./hyprland.nix
    ./laptop.nix
    ./gui-packages.nix
    ./sops.nix
    ./starship.nix
  ];

  config = lib.mkIf config.c-opt.programs.utils.enable {
    # System wide packages.
    environment.systemPackages = with pkgs; [
      # Archives
      p7zip
      unzip
      zip

      # Drive/filesystems
      btrfs-progs
      gparted

      # Internet/Connectivity
      curl
      wget

      # System monitoring
      atop
      duf
      gtop
      nvtopPackages.full

      # Other
      bat
      ripgrep
    ];

    services = {
      udisks2.enable = true;
    };

    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [
        lm_sensors
        nix-output-monitor
        nvd
      ];

      programs = {
        # Enable nh.
        # https://github.com/nix-community/nh
        nh = {
          enable = true;
          # Enable garbage cleanup.
          clean.enable = true;
          # System flake location.
          flake = "${config.c-opt.user.homeDirectory}/nixos-config";
        };
      };
    };

  };
}
