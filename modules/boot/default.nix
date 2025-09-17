{ lib, ... }:
{
  imports = [
    ./grub.nix
  ];

  c-opt = {
    grub.enable = lib.mkDefault true;
  };
}
