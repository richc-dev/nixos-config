{ config, pkgs, ... }:
let
nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
{
  imports = [
    ./hardware.nix

    ./../../modules/programs
  ];

  # Define the device's hostname.
  networking.hostName = "rcc-laptop";

  boot = {
    # Enables the amd cpu scaling https://www.kernel.org/doc/html/latest/admin-guide/pm/amd-pstate.html
    # On recent AMD CPUs this can be more energy efficient.
    kernelParams = [ "amd_pstate=active" ];
  };

  services.xserver.videoDrivers = [ "amdgpu" "modesetting" ];

  # Nvidia laptop settings.
  # https://wiki.nixos.org/wiki/NVIDIA#Offload_mode
  hardware.nvidia = {
    powerManagement = {
      enable = false;
      finegrained = true;
    };

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  c-opt = {
    stateVersion = "24.05";
    persistence.enable = false;
  };
}
