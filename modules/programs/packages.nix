{ config, pkgs, ... }:
{
  home-manager.users.${config.c-opt.user.name} = {
    home.packages = with pkgs; [
      anki
      clapper
      kdePackages.dolphin
      kdePackages.dolphin-plugins
      dropbox
      freecad-wayland
      gnucash
      hunspell
      kdePackages.kate
      libreoffice
      nomacs
      obs-studio
      obsidian
      orca-slicer
      overskride
      qbittorrent
      readest
      qalculate-gtk
      winetricks
      wineWowPackages.full

      thunderbird

      material-symbols
    ];

    programs = {

      keepassxc = {
        enable = true;
        #autostart = true;
      };

      mullvad-vpn = {
        enable = true;
      };

      #thunderbird = {
      #  enable = true;
      #};

      vesktop = {
        enable = true;
      };

    };
  };

  programs = {
    ssh.startAgent = true;
  };

  services = {
    openssh.enable = true;

    resolved.enable = true;
  };
}
