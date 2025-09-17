{ config, lib, ... }:
{
  options.c-opt.grub.enable = lib.mkEnableOption "Grub bootloader";

  config = lib.mkIf config.c-opt.grub.enable {
    boot.loader = {
      # Disable systemd-boot
      systemd-boot.enable = lib.mkForce false;

      # Enable grub.
      grub = {
        enable = true;
        useOSProber = true;
        device = "nodev";
        efiSupport = true;
      };
    };
  };
}
