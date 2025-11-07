# SDDM for managing display managers.
# https://github.com/sddm/sddm/
{ config, lib, pkgs, ...}:
let
  cfg = config.c-opt;
in
{
  options.c-opt.de.sddm = lib.mkEnableOption "Enable SDDM";

  config = lib.mkIf cfg.de.sddm {
    services.displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
      extraPackages = with pkgs.kdePackages; [
        qtsvg
        qtvirtualkeyboard
      ];
    };
  };
}
