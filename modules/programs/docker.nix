{ config, lib, ... }:
{
  config = lib.mkIf config.c-opt.programs.docker.enable {
    virtualisation.docker = {
      enable = true;
    };
  };
}
