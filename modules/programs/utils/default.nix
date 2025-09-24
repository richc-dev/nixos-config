{ lib, ... }:
{
  imports = [
    ./fish.nix
    ./gpg.nix
    ./kitty.nix
    ./laptop.nix
    ./packages.nix
    ./starship.nix
  ];

  c-opt = {
    terminal = {
      fish.enable = lib.mkDefault true;
      starship.enable = lib.mkDefault true;
    };
  };
}
