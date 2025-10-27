{ config, lib, pkgs, ... }:
{
  options.c-opt.programs.browsers.librewolf.enable = lib.mkEnableOption "Librewolf";

  config = lib.mkIf config.c-opt.programs.browsers.librewolf.enable {
    home-manager.users.${config.c-opt.user.name} =
    { pkgs, ... }:
    {
      programs = {
        # Install LibreWolf.
        librewolf = {
          enable = true;
          package = pkgs.librewolf;
          nativeMessagingHosts = [ pkgs.passff-host ];
          policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            # Add search engines.
            SearchEngines = {
              Default = "Presearch";
              Add = [
                # Presearch: Private search engine.
                # https://presearch.com/learn-more
                {
                  Name = "Presearch";
                  URLTemplate = "https://presearch.com/search?q={searchTerms}";
                  IconURL = "https://na-us-2.presearch.com/images/icon.svg";
                  Alias = "@ps";
                }
                # Merriam-Webster dictionary: For finding the meaning of that obscure word your
                # friend used to sound smart.
                # https://www.merriam-webster.com/about-us
                {
                  Name = "Merriam-Webster Dictionary";
                  URLTemplate = "https://www.merriam-webster.com/dictionary/{searchTerms}";
                  IconURL = "https://www.merriam-webster.com/favicon.svg";
                  Alias = "@mw";
                }
                # Constantly typing "search.nixos.org" got annoying.
                {
                  Name = "Nix Packages";
                  URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
                  IconURL = "https://search.nixos.org/favicon.png";
                  Alias = "@np";
                }
                {
                  Name = "NixOS Options";
                  URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
                  IconURL = "https://search.nixos.org/favicon.png";
                  Alias = "@no";
                }
              ];
            };
            Preferences = {
              "privacy.resistFingerprinting" = false;
              "privacy.fingerprintingProtection" = true;
              "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
            };
            ExtensionSettings = {
              "{d19a89b9-76c1-4a61-bcd4-49e8de916403}" = {
                install_url = "https://github.com/mullvad/browser-extension/releases/download/v0.9.5-firefox-beta/mullvad-browser-extension-0.9.5.xpi";
                installation_mode = "force_installed";
              };
              "passff@invicem.pro" = {
                install_url = "https://addons.mozilla.org/firefox/downloads/latest/passff/latest.xpi";
                installation_mode = "force_installed";
              };
            };
          };
        };

      };
    };

  };
}
