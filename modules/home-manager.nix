{ config, lib, pkgs, noctalia, ... }:
{
  home-manager = {
    extraSpecialArgs = {
      inherit noctalia;
    };

    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "hm-backup";

    users.${config.c-opt.user.name} = {
        # Common config.
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
