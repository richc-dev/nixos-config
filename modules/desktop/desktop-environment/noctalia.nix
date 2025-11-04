# Noctalia config
# https://github.com/noctalia-dev/noctalia-shell
{ config, lib, noctalia, pkgs, system, ... }:
let
  cfg = config.c-opt;
in
{
  config = lib.mkIf cfg.de.noctalia.enable {
    environment.systemPackages = [ noctalia.packages.${system}.default ];

    home-manager.users.${cfg.user.name} =
    { noctalia, ... }:
    {
      imports = [ noctalia.homeModules.default ];
    };
  };
}
