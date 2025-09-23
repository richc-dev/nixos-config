# Configures laptop specific settings like power management.

{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.laptop {
    environment.systemPackages = with pkgs; [
      brightnessctl
      powertop
    ];

    services = {
      # Enable TLP
      # https://nixos.wiki/wiki/Laptop
      # https://wiki.archlinux.org/title/TLP
      # https://linrunner.de/tlp/settings/index.html
      tlp = {
        enable = true;
        settings = {
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

          CPU_MIN_PERF_ON_AC = 0;
          CPU_MAX_PERF_ON_AC = 100;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 20;

          # Helps with long term battery health
          START_CHARGE_THRESH_BAT0 = 40;
          STOP_CHARGE_THRESH_BAT0 = 80;
        };
      };

      # Enable upower
      upower = {
        enable = true;
      };

    };

  };
}
