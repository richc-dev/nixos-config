# Eilmeldung config.
# https://github.com/christo-auer/eilmeldung
{ config, eilmeldung, lib, pkgs, system, ... }:
let
  cfg = config.c-opt;
in
{
  config = {
    nixpkgs.overlays = [ eilmeldung.overlays.default ];

    environment.systemPackages = [ pkgs.eilmeldung ];
    home-manager.users.${cfg.user.name} =
      { eilmeldung, ... }:
      {
        imports = [ eilmeldung.homeManager.default ];

        programs.eilmeldung = {
          enable = true;
        };
      };
  };
}
