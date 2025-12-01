# Hypridle config.
# https://wiki.hypr.land/Hypr-Ecosystem/hypridle/

{ config, lib, pkgs, ... }:
{
  options.c-opt.graphical.hypridle.enable = lib.mkEnableOption "Enable Hypridle";

  config = lib.mkIf config.c-opt.graphical.hypridle.enable {

    home-manager.users.${config.c-opt.user.name} = {
      home.packages = with pkgs; [ hypridle ];

      services.hypridle = {
        enable = true;
        settings = {
          general = {
            lock_cmd = "pidof hyprlock || hyprlock"; # Avoid starting Hyprlock multple times.
            before_sleep_cmd = "loginctl lock-session";
          };

          listener = [
            {
              timeout = 150;                          # 2.5min.
              on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
              on-resume = "brightnessctl -r";         # monitor backlight restore.
            }

            # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
            {
              timeout = 150;                                            # 2.5min.
              on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
              on-resume = "brightnessctl -rd rgb:kbd_backlight";        # turn on keyboard backlight.
            }

            {
              timeout = 600;                        # 10min
              on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
            }
	    
            {
              timeout = 1800;                   # 30min
              on-timeout = "systemctl suspend"; # suspend pc
            }
          ];

        };
      };
    };

  };
}
