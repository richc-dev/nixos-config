{
  description = "NixOS config";

  inputs = {
    # Nixpkgs branch to use (unstable in this case).
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Nixpkgs stable branch.
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    # Nix VSCode Extensions allows use of VSCodium extensions not in nixpkgs.
    # https://github.com/nix-community/nix-vscode-extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    # https://github.com/nix-community/impermanence
    impermanence.url = "github:nix-community/impermanence";

    # Home Manager
    # https://github.com/nix-community/home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nix-vscode-extensions,
    home-manager,
    impermanence
  }@inputs:
  let
    # Modules shared between all systems.
    sharedModules = [
      impermanence.nixosModule
      home-manager.nixosModules.home-manager

      ./modules
    ];

    specialArgs = {
      inherit nix-vscode-extensions;
    };
  in
  {
    nixosConfigurations = {
      # Laptop config.
      rcc-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        inherit specialArgs;

        modules = sharedModules ++ [
          ./hosts/rcc-laptop
        ];
      };

    };
  };
}
