{ config, pkgs, ... }:
{
  home-manager.users.${config.c-opt.user.name} = {
    home.packages = with pkgs; [
      anki
      kdePackages.dolphin
      kdePackages.dolphin-plugins
      dropbox
      freecad-wayland
      gnucash
      hunspell
      libreoffice
      obsidian
      orca-slicer
      qbittorrent
      readest
      qalculate-gtk
      winetricks
      wineWowPackages.full

      thunderbird
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

  services = {
    openssh.enable = true;

    resolved.enable = true;
  };
}
