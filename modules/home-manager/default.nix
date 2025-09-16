{ config, lib, pkgs, ... }:
let
  user = config.c-opt.user.name;
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${user} =
      { ... }:
      {
        # Common config.
        imports = [
          # Import user config.
          ../../users/${config.c-opt.user.name}/home.nix
        ];

        home = {
          stateVersion = config.c-opt.stateVersion;
          username = config.c-opt.user.name;
          homeDirectory = config.c-opt.user.homeDirectory;
        };

        # Let Home Manager install and manage itself.
        programs.home-manager.enable = true;
      };

  };
}
