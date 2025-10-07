{ lib, ... }:
{
  imports = [
    ./grub.nix
    ./impermanence.nix
  ];

  c-opt = {
    grub.enable = lib.mkDefault true;
    impermanence.enable = lib.mkDefault false;
  };
}
