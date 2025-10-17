# Privacy programs like VPNs and password managers.
# https://mullvad.net/
# https://www.passwordstore.org/
# https://dyne.org/tomb/

{ config, lib, pkgs, ... }:
{
  options.c-opt.programs.privacy.enable = lib.mkEnableOption "Enable Privacy Focused Programs";

  config = lib.mkIf config.c-opt.programs.privacy.enable {
    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [
        pass
        passExtensions.pass-audit
        passExtensions.pass-genphrase
        passExtensions.pass-tomb
        passExtensions.pass-update
        ripasso-cursive
        tomb
      ];

      programs = {
        mullvad-vpn = {
          enable = true;
          package = pkgs.mullvad-vpn;
        };

        keepassxc = {
          enable = true;
          settings = {
            Browser = {
              Enabled = true;
              UpdateBinaryPath = false;
            };

            GUI = {
              ApplicationTheme = "dark";
            };
          };
        };

      };
    };

    services = {
      resolved.enable = true;
      mullvad-vpn.enable = true;
    };
  };
}
