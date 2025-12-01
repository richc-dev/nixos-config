# Hyprlock config.
# https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/

{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.graphical.hyprlock.enable {

    # Required for hyprlock.
    # https://mynixos.com/home-manager/option/programs.hyprlock.enable
    security.pam.services.hyprlock = {};

    home-manager.users.${config.c-opt.user.name} = {
      programs.hyprlock = {
        enable = true;
        settings = {
          "$font" = "${config.c-opt.theme.fonts.monospace.name}";

          animations = {
            enabled = true;
            bezier = "linear, 1, 1, 0, 0";
            animation = [
              "fadeIn, 1, 5, linear"
              "fadeOut, 1, 5, linear"
              "inputFieldDots, 1, 2, linear"
            ];
          };

          background = {
            monitor = "";
            path = "screenshot";
            blur_passes = 3;
          };

          input-field = {
            monitor = "";
            size = "20%, 5%";
            outline_thickness = 3;
            inner_color = "rgba(0, 0, 0, 0)";

            outer_color = "rgba(100,0,0,1) rgba(50,0,0,1) 45deg";
            check_color = "rgba(0,150,0,1) rgba(0,100,0,1) 120deg";
            fail_color = "rgba(200,0,0,1) rgba(150,0,0,1) 40deg";

            font_color = "rgb(220, 220, 220)";
            fade_on_empty = false;
            rounding = 0;

            font_family = "$font";
            placeholder_text = "Input password...";
            fail_text = "$PAMFAIL";

            dots_spacing = 0.3;

            position = "0, -20";
            halign = "center";
            valign = "center";
          };

          label = [
            # Username
            {
              monitor = "";
              text = "$DESC";
              font_size = 20;

              position = "0, 15";
              halign = "center";
              valign = "center";
            }
            # Time.
            {
              monitor = "";
              text = "$TIME";
              font_size = 90;
              font_family = "$font";

              position = "30, 0";
              halign = "left";
              valign = "top";
            }

            # Date.
            {
              monitor = "";
              text = "cmd[update:60000] date +\"%A, %d %B %Y\""; # update every 60 seconds
              font_size = 25;
              font_family = "$font";

              position = "30, -150";
              halign = "left";
              valign = "top";
            }
          ];

        };
      };
    };

  };
}
