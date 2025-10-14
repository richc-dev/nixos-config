{ caelestia-shell, nixpkgs-stable, system, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      stable = nixpkgs-stable;
      caelestia-shell = caelestia-shell.packages.${system}.caelestia-shell;
      caelestia-cli = caelestia-shell.inputs.caelestia-cli.packages.${system}.caelestia-cli;
    })
  ];
}
