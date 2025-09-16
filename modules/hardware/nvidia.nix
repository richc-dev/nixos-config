# Nvidia settings.
# https://wiki.nixos.org/wiki/NVIDIA

{ config, lib, pkgs, ... }:
{
  # Allow turning the Nvidia module off.
  options.c-opt.nvidia.enable = lib.mkEnableOption "Enables the Nvidia config";

  config = lib.mkIf config.c-opt.nvidia.enable {
    hardware = {
      # Enable OpenGL
      graphics.enable = true;

      nvidia = {
        # Modesetting is required.
        modesetting.enable = true;
        # Enable Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;
        # Use the Nvidia open source kernel module (not to be confused with the
        # independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of
        # supported GPUs is at:
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
        open = true;
      };
    };
  };
}
