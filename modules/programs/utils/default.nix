# Enable miscellaneous utilities.

{ config, lib, pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./ghostty.nix
    ./gpg.nix
    ./hyprland.nix
    ./kitty.nix
    ./laptop.nix
    ./gui-packages.nix
    ./sops.nix
    ./starship.nix
  ];

  options.c-opt.programs.utils = {
    enable = lib.mkEnableOption "Enable system utilities";
    terminal.enable = lib.mkEnableOption "Enable terminal";
  };

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
      gtop

      # Other
      git
      ripgrep
    ];

    services = {
      udisks2.enable = true;
    };

    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [
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
      };
    };

    programs = {
      ssh.startAgent = true;
    };

    services = {
      openssh.enable = true;
    };
  };
}
