{ config, pkgs, pkgs-stable, ... }:
{
  environment.systemPackages = with pkgs; [ podman-compose ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  home-manager.users.${config.c-opt.user.name} = {
    home.packages = with pkgs; [
      android-file-transfer
      anki
      dropbox
      gedit
      lf
      nushell
      orca-slicer
      perl5Packages.FileMimeInfo
      qalculate-gtk
      qbittorrent
      winetricks
      wineWow64Packages.full
      zettlr

      thunderbird
    ] ++ [
      pkgs-stable.freecad
    ];

    programs = {
      #thunderbird = {
      #  enable = true;
      #};

      vesktop = {
        enable = true;
      };

    };

  };
}
