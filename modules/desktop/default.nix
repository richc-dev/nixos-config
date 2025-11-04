{ config, ... }:
{
  imports = [
    ./desktop-environment
    ./sound.nix
    ./theme.nix
  ];

  c-opt = {
    sound.enable = true;
    graphical.theme.enable = true;
  };
}
