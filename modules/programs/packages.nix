{ config, pkgs, ... }:
{
  home-manager.users.${config.c-opt.user.name} = {
    home.packages = with pkgs; [
      android-file-transfer
      anki
      dropbox
      freecad-wayland
      lf
      orca-slicer
      perl540Packages.FileMimeInfo
      qalculate-gtk
      winetricks
      wineWowPackages.stagingFull

      thunderbird
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
