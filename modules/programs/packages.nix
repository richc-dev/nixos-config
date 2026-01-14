{ config, pkgs, ... }:
{
  home-manager.users.${config.c-opt.user.name} = {
    home.packages = with pkgs; [
      android-file-transfer
      anki
      dropbox
      freecad-wayland
      gedit
      lf
      orca-slicer
      perl5Packages.FileMimeInfo
      qalculate-gtk
      winetricks
      wineWowPackages.stagingFull

      thunderbird
    ] ++ [ config.c-pkgs.repeater ];

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
