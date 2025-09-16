{ config, lib, pkgs, ... }:
{
  options.c-opt.browsers.enable = lib.mkEnableOption "Browsers";

  config = lib.mkIf config.c-opt.browsers.enable {

    home-manager.users.${config.c-opt.user.name} = {

      home.packages = with pkgs; [
        tor-browser
      ];

      programs = {

        # Install Brave
        chromium = {
          enable = true;
          package = pkgs.brave;
        };

        # Install LibreWolf.
        firefox = {
          enable = true;
          package = pkgs.librewolf;
          # nativeMessagingHosts.packages = [ pkgs.kdePackages.plasma-browser-integration ];
          policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            Preferences = {
              "privacy.resistFingerprinting" = false;
              "privacy.fingerprintingProtection" = true;
              "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
            };
            ExtensionSettings = {
              "keepassxc-browser@keepassxc.org" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
                installation_mode = "force_installed";
              };
              "plasma-browser-integration@kde.org" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
                installation_mode = "force_installed";
              };
            };
          };
        };

      };

    };
  };
}
