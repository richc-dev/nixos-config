{ config, ... }:
{
  imports = [
    ./desktop-environment
    ./sound
    ./theme
  ];

  c-opt = {
    sound.enable = true;
    graphical.theme.enable = true;
  };
}
