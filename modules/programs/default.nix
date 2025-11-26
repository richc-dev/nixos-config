{ lib, ... }:
{
  imports = [
    ./audio
    ./browsers
    ./games
    ./image
    ./office
    ./privacy
    ./programming
    ./utils
    ./video
    ./packages.nix
  ];

  c-opt.programs = {
    browsers = {
      enable = lib.mkDefault true;
      librewolf.enable = lib.mkDefault true;
    };
    image.enable = lib.mkDefault true;
    office.enable = lib.mkDefault true;
    privacy.enable = lib.mkDefault true;
    programming = {
      enable = lib.mkDefault true;
      vscodium.enable = lib.mkDefault true;
    };
    utils = {
      enable = lib.mkDefault true;
      gui.enable = lib.mkDefault true;
      terminal = {
        enable = lib.mkDefault true;
        fish.enable = lib.mkDefault true;
        starship.enable = lib.mkDefault true;
      };
    };
    video = {
      enable = lib.mkDefault true;
      davinciResolve.enable = lib.mkDefault false;
    };
  };
}
