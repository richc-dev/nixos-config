{ config, lib, ... }:
{
  options.c-opt.hardware = {
    nvidia.enable = lib.mkEnableOption "Enable nvidia drivers";
    laptop.enable = lib.mkEnableOption "Enable laptop configs";
  };
}
