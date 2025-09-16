# Enable miscellaneous utilities.

{ config, lib, pkgs, ... }:
{
  # System wide packages.
  environment.systemPackages = with pkgs; [
    # Archives
    p7zip
    unzip
    zip

    # Drive/filesystems
    btrfs-progs
    gparted

    # Internet
    curl
    wget

    # Other
    git
  ];

  home-manager.users.${config.c-opt.user.name} = {
    home.packages = with pkgs; [
      nix-output-monitor
      nvd
    ];

    # Enable nh.
    # https://github.com/nix-community/nh
    programs.nh = {
      enable = true;
      # Enable garbage cleanup.
      clean.enable = true;
      # System flake location.
      flake = "${config.c-opt.user.homeDirectory}/nixos-config";
    };
  };
}
