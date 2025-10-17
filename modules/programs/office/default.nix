# Office programs.

{ config, lib, pkgs, ... }:
{
  options.c-opt.programs.office.enable = lib.mkEnableOption "Install office programs";

  config = lib.mkIf config.c-opt.programs.office.enable {

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
