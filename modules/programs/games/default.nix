{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.programs.gaming.enable {
    imports = [
      ./steam.nix
    ];

    programs.gamemode.enable = true;

    # Enable Steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open firewall ports for Steam Remote Play.
      localNetworkGameTransfers.openFirewall = true; # Open firewall for local game transfers.
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    home-manager.users.${config.c-opt.user.name} = {
      programs.lutris = {
        enable = true;
      };

      home.packages = with pkgs; [
        heroic
        mangohud
      ];
    };
  };
}
