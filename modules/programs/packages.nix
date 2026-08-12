{ config, pkgs, pkgs-stable, ... }:
{
  environment.systemPackages = with pkgs; [ podman-compose ];

  virtualisation = {
    podman = {
        enable = true;
        dockerCompat = true;
      };

      libvirtd = {
        enable = true;
      };
  };

  programs.virt-manager.enable = true;

  services = {
    resolved.enable = true;
    mullvad-vpn = {
      enable = true;
    };
  };

  home-manager.users.${config.c-opt.user.name} = {
    home.packages = with pkgs; [
      android-file-transfer
      anki
      lf
      nushell
      perl5Packages.FileMimeInfo
      qalculate-gtk
      qbittorrent
      winetricks
      wineWow64Packages.full
      zettlr

      thunderbird
    ];

    programs = {
      #thunderbird = {
      #  enable = true;
      #};

      mullvad-vpn = {
        enable = true;
      };

      vesktop = {
        enable = true;
      };

    };

  };
}
