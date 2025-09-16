# VSCode config.
{ config, nix-vscode-extensions, pkgs, /*pkgs-stable,*/ ... }:
{
  options.c-opt.vscodium.enable = lib.mkEnableOption "VSCodium";

  config = lib.mkIf config.c-opt.vscodium.enable {

    nixpkgs.overlays = [
      nix-vscode-extensions.overlays.default
    ];

    users.users.${config.c-opt.user.name}.packages = [
      (pkgs.vscode-with-extensions.override {
        vscode = pkgs.vscodium;
        vscodeExtensions = [
          pkgs.open-vsx.bbenoist.nix
          pkgs.open-vsx.editorconfig.editorconfig
          # pkgs-stable.vscode-extensions.devsense.phptools-vscode
          pkgs.vscode-marketplace.ms-python.vscode-pylance
          pkgs.open-vsx.ms-python.python
          pkgs.open-vsx.pkief.material-icon-theme
          pkgs.open-vsx.arrterian.nix-env-selector
        ];
      })
    ];

  };
}
