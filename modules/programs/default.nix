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
      gui.enable = lib.mkDefault true;
      terminal = {
        fish.enable = lib.mkDefault true;
        starship.enable = lib.mkDefault true;
      };
    };
  };
}
