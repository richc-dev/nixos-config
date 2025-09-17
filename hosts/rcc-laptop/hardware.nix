{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/C22C-8018";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  boot.initrd.luks.devices."nixos-enc" = {
    device = "/dev/disk/by-uuid/f3dcdae8-eb0b-423b-bb8a-b885a03ee57b";
    preLVM = true;
  };

  fileSystems."/" = {
    device = "/dev/nixos-vg/root";
    fsType = "btrfs";
    options = [ "subvol=root" ];
  };

  fileSystems."/nix" = {
    device = "/dev/nixos-vg/root";
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };

  fileSystems."/persistent" = {
    device = "/dev/nixos-vg/root";
    fsType = "btrfs";
    options = [ "subvol=persistent" ];
  };

  swapDevices = [
    { device = "/dev/nixos-vg/swap"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
