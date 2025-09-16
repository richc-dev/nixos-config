{ inputs, ... }:
{
  pkgs-stable = final: prev: {
    stable = import inputs.nixpkgs-stable {system = final.system;};
  };
}
