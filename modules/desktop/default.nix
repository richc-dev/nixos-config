{ config, ... }:
{
  imports = [
    ./desktop-environment
    ./sound.nix
    ./theme.nix
  ];

  c-opt = {
    sound.enable = true;
    theme.enable = true;
  };
}
