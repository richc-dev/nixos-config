{ caelestia-shell, nix-vscode-extensions, system, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      caelestia-shell = caelestia-shell.packages.${system}.caelestia-shell;
      caelestia-cli = caelestia-shell.inputs.caelestia-cli.packages.${system}.caelestia-cli;
    })
  ];
}
