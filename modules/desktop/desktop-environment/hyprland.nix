# Hyprland config.
# See homepage: https://hypr.land/
# See Hyprland wiki: https://wiki.hypr.land/
# A good example config is
# https://github.com/dc-tec/nixos-config/blob/a890ee9bf0e93ec7c1652c23e84f4366076642fb/modules/nixos/desktop/desktop-environment/hyprland.nix

{ config, hyprland, lib, pkgs, ... }:
{
  options.c-opt.graphical.hyprland = {
    enable = lib.mkEnableOption "hyprland wm";
    monitors = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ", preferred, auto, auto" ];
      description = "Per-device monitor config.";
    };
  };

  config = lib.mkIf config.c-opt.graphical.hyprland.enable {

    # Set up cache for Hyprland.
    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };

    services = {
      # Load Nvidia driver.
      xserver.videoDrivers = [ "nvidia" "amdgpu" ];

      # Load sddm.
      displayManager.sddm = {
          enable = true;
          package = pkgs.kdePackages.sddm;
          wayland.enable = true;
          extraPackages = with pkgs.kdePackages; [
            qtsvg
            qtvirtualkeyboard
          ];
      };
    };

    # Enable NixOS Hyprland module.
    programs.hyprland = {
      enable = true;
      package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    home-manager.users.${config.c-opt.user.name} =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          kdePackages.plasma5support
          qt5.qtwayland
          qt6.qtwayland
        ];

        services = {
          cliphist.enable = true;
          playerctld.enable = true;
          # Enable Hyprpolkitagent
          # https://wiki.hypr.land/Hypr-Ecosystem/hyprpolkitagent/
          hyprpolkitagent.enable = true;
        };

        # Home manager Hyprland module.
        wayland.windowManager.hyprland = {
          enable = true;
          # package = null;
          # portalPackage = null;
          # xwayland.enable = true;

          settings = {

            # See https://wiki.hypr.land/Configuring/Monitors/

            monitor = config.c-opt.graphical.hyprland.monitors;

            # #########
            # PROGRAMS
            # #########
            # See https://wiki.hypr.land/Configuring/Keywords/

            "$browser" = "librewolf";
            "$fileManager" = "dolphin";
            "$menu" = "wofi --show drun";
            "$mod" = "SUPER";
            "$terminal" = "kitty";

            xwayland.force_zero_scaling = true;

            # ##########
            # AUTOSTART
            # ##########

            exec-once = [
              "$terminal"
              "hypridle"
              # "quickshell"
              "sleep 1 ; exec sh /home/${config.c-opt.user.name}/nixos-config/scripts/random-wallpaper.sh"
            ];

            # ######################
            # ENVIRONMENT VARIABLES
            # ######################
            # See https://wiki.hypr.land/Configuring/Environment-variables/

            env = [
              "NIXOS_OZONE_WL,1"
              "XCURSOR_SIZE,24"
              "HYPRCURSOR_SIZE,24"
              "LIBVA_DRIVER_NAME,nvidia"
              "__GLX_VENDOR_LIBRARY_NAME,nvidia"
            ];

            # ##############
            # LOOK AND FEEL
            # ##############
            # See https://wiki.hypr.land/Configuring/Variables/
            # https://wiki.hypr.land/Configuring/Variables/#general

            general = {
              gaps_in = 2;
              gaps_out = 2;

              border_size = 2;

              # https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
              "col.active_border" = "rgba(100,0,0,1) rgba(50,0,0,1) 45deg";
              "col.inactive_border" = "rgba(595959aa)";

              # Set to true enable resizing windows by clicking and dragging on borders and gaps
              resize_on_border = false;

              # Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
              allow_tearing = false;

              layout = "dwindle";
            };

            # https://wiki.hypr.land/Configuring/Variables/#decoration
            decoration = {
              rounding = 20;
              rounding_power = 1;

              # Change transparency of focused and unfocused windows
              active_opacity = 0.95;
              inactive_opacity = 0.8;

              shadow = {
                enabled = true;
                range = 4;
                render_power = 3;
                color = "rgba(1a1a1aee)";
              };

              # See https://wiki.hypr.land/Configuring/Variables/#blur
              blur = {
                enabled = true;
                size = 3;
                passes = 1;
                vibrancy = 0.1696;
              };
            };

            # See https://wiki.hypr.land/Configuring/Variables/#animations
            animations = {
              enabled = true;
              # Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
              #
              bezier = [
                # NAME          X0     Y0    X1    Y1
                "easeOutQuint,   0.23, 1,    0.32, 1"
                "easeInOutCubic, 0.65, 0.05, 0.36, 1"
                "linear,         0,    0,    1,    1"
                "almostLinear,   0.5,  0.5,  0.75, 1"
                "quick,          0.15, 0,    0.1,  1"
              ];

              # See https://wiki.hypr.land/Configuring/Animations/
              animation = [
                # NAME          ONOFF SPEED CURVE        [STYLE]
                "global,        1,    10,   default"
                "border,        1,    5.39, easeOutQuint"
                "windows,       1,    4.79, easeOutQuint"
                "windowsIn,     1,    4.1,  easeOutQuint, popin 87%"
                "windowsOut,    1,    1.49, linear,       popin 87%"
                "fadeIn,        1,    1.73, almostLinear"
                "fadeOut,       1,    1.46, almostLinear"
                "fade,          1,    3.03, quick"
                "layers,        1,    3.81, easeOutQuint"
                "layersIn,      1,    4,    easeOutQuint, fade"
                "layersOut,     1,    1.5,  linear,       fade"
                "fadeLayersIn,  1,    1.79, almostLinear"
                "fadeLayersOut, 1,    1.39, almostLinear"
                "workspaces,    1,    1.94, almostLinear, fade"
                "workspacesIn,  1,    1.21, almostLinear, fade"
                "workspacesOut, 1,    1.94, almostLinear, fade"
                "zoomFactor,    1,    7,    quick"
              ];
            };

            # See https://wiki.hypr.land/Configuring/Workspace-Rules/

            # See https://wiki.hypr.land/Configuring/Dwindle-Layout/
            dwindle = {
              pseudotile = true;
              preserve_split = true;
            };

            # See https://wiki.hypr.land/Configuring/Master-Layout/
            master = {
              new_status = "master";
            };

            # See https://wiki.hypr.land/Configuring/Variables/#misc
            misc = {
              force_default_wallpaper = -1;
              disable_hyprland_logo = true;
            };

            # ######
            # INPUT
            # ######

            # See https://wiki.hypr.land/Configuring/Variables/#input
            input = {
              kb_layout = "us";
              follow_mouse = true;
              touchpad = {
                natural_scroll = false;
              };
              sensitivity = 0;
            };

            # See https://wiki.hypr.land/Configuring/Gestures
            gesture = [
              "3, horizontal, workspace"
            ];

            # ############
            # KEYBINDINGS
            # ############
            # See https://wiki.hypr.land/Configuring/Binds/
            bind = [
              # Programs
              "$mod, Q, exec, $terminal"
              "$mod, C, killactive,"
              "$mod, E, exec, $fileManager"
              "$mod, V, togglefloating,"
              "$mod, R, exec, $menu"
              "$mod, P, pseudo,"
              "$mod, J, togglesplit,"
              "$mod, B, exec, $browser"
              "$mod, F, exec, fuzzel"

              # Screenshots
              "$mod, S, exec, grim - | swappy -f -"
              "$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"
              "$mod ALT+SHIFT, S, exec, grim -g \"$(slurp)\" - | swappy -f -"

              # Move focus with $mod + arrow keys
              "$mod, left, movefocus, l"
              "$mod, right, movefocus, r"
              "$mod, up, movefocus, u"
              "$mod, down, movefocus, d"

              # Switch workspaces with $mod + [0-9]
              "$mod, 1, workspace, 1"
              "$mod, 2, workspace, 2"
              "$mod, 3, workspace, 3"
              "$mod, 4, workspace, 4"
              "$mod, 5, workspace, 5"
              "$mod, 6, workspace, 6"
              "$mod, 7, workspace, 7"
              "$mod, 8, workspace, 8"
              "$mod, 9, workspace, 9"
              "$mod, 0, workspace, 10"

              # Move active window to a workspace with $mod + SHIFT + [0-9]
              "$mod SHIFT, 1, movetoworkspace, 1"
              "$mod SHIFT, 2, movetoworkspace, 2"
              "$mod SHIFT, 3, movetoworkspace, 3"
              "$mod SHIFT, 4, movetoworkspace, 4"
              "$mod SHIFT, 5, movetoworkspace, 5"
              "$mod SHIFT, 6, movetoworkspace, 6"
              "$mod SHIFT, 7, movetoworkspace, 7"
              "$mod SHIFT, 8, movetoworkspace, 8"
              "$mod SHIFT, 9, movetoworkspace, 9"
              "$mod SHIFT, 0, movetoworkspace, 10"

              # Example special workspace (scratchpad)
              "$mod, M, togglespecialworkspace, magic"
              "$mod SHIFT, M, movetoworkspace, special:magic"

              # Scroll through existing workspaces with $mod + scroll
              "$mod, mouse_down, workspace, e+1"
              "$mod, mouse_up, workspace, e-1"
            ];

            bindm = [
              # Move/resize windows with $mod + LMB/RMB and dragging
              "$mod, mouse:272, movewindow"
              "$mod, mouse:273, resizewindow"
            ];

            bindel = [
              # Laptop multimedia keys for valume and LCD brightness
              ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
              ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
              ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
              ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
              ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
              ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"

              # Requires playerctl
              ",XF86AudioNext, exec, playerctl next"
              ",XF86AudioPause, exec, playerctl play-pause"
              ",XF86AudioPlay, exec, playerctl play-pause"
              ",XF86AudioPrev, exec, playerctl previous"
            ];

            # #######################
            # WINDOWS AND WORKSPACES
            # #######################
            # See https://wiki.hypr.land/Configuring/Window-Rules/
            # See https://wiki.hypr.land/Configuring/Workspace-Rules/
            windowrule = [
              "suppressevent maximize, class:.*"
              "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen0,pinned:0"
              "opaque, class:mpv"
            ];

            # systemd.enable = true;

          };
        };

      };

  };
}
