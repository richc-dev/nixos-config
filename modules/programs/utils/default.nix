# Enable miscellaneous utilities.

{ config, pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./gpg.nix
    ./hyprland.nix
    ./kitty.nix
    ./laptop.nix
    ./gui-packages.nix
    ./sops.nix
    ./starship.nix
  ];

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

    # Other
    git
    ripgrep
  ];

  services = {
    udisks2.enable = true;
  };

  home-manager.users.${config.c-opt.user.name} = {
    home.packages = with pkgs; [
      kdePackages.ark
      aubio
      gh
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

      swappy.enable = true;
    };
  };

  programs = {
    ssh.startAgent = true;
  };

  services = {
    openssh.enable = true;
  };
}
