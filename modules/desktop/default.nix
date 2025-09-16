{ config, ... }:
{
  imports = [
    ./desktop-environment
    ./sound
  ];

  c-opt = {
    sound.enable = true;
  };
}
