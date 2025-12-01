{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.programs.audio.mpd.enable {
    services.mpd = {
      enable = true;
      musicDirectory = lib.mkDefault "${config.c-opt.user.homeDirectory}/Music/mpd";
      user = "${config.c-opt.user.name}";
      extraConfig = ''
        audio_output {
	  type "pipewire"
	  name "Pipewire output"
	}
      '';
      startWhenNeeded = true;
    };

    systemd.services.mpd.environment = {
      XDG_RUNTIME_DIR = "/run/user/1000";
    };

    environment.systemPackages = with pkgs; [
      mpdris2
    ];
  };
}