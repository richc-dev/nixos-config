# Loads modules needed for specific hardware.
{ lib, ... }:
{
  imports = [
    ./nvidia.nix
  ];

  # `c-opt` stands for "custom option".
  c-opt = {
    # Enable the Nvidia module by default
    # since all my devices have a Nvidia GPU.
    nvidia.enable = lib.mkDefault true;
  };
}
