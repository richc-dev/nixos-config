# Office programs.

{ config, lib, pkgs, ... }:
{
  options.c-opt.packages.office.enable = lib.mkEnableOption "Install office programs";

  config = lib.mkIf config.c-opt.packages.office.enable {

    home-manager.users.${config.c-opt.user.name}.home = {
      packages = with pkgs; [
        gnucash
        hunspell # For LibreOffice
        libreoffice
        obsidian
        perl540Packages.FinanceQuote # For GnuCash
        readest
      ];
    };

  };
}
