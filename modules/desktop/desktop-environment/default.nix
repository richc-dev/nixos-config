{ config, lib, ... }:
{
  imports = [
    ./plasma6.nix
  ];

  c-opt = {
    plasma.enable = lib.mkDefault true;
  };
}
