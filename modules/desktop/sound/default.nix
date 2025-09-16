{ ... }:
{
    options.c-opt.sound.enable = lib.mkEnableOption "Sound";

    config = mkIf config.c-opt.sound.enable {
      # Enable sound with Pipewire.
      # https://wiki.nixos.org/wiki/PipeWire
      security.rtkit.enable = true;
      services = {
        pulseaudio.enable = false;
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
        };
      };

      # Enable bluetooth
      # https://wiki.nixos.org/wiki/Bluetooth
      hardware.bluetooth = {
        enable = lib.mkDefault true;
        pulseaudio.enable = false;
      };
    };
}
