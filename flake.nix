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
    # Home Manager doesn't generate the configs when using `nixos-rebuid boot`
    # command. And yes, I am an IDIOT who spent hours trying to figure out
    # why Home Manager wasn't applying configs.
    # https://github.com/nix-community/home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    # https://hypr.land
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nix-vscode-extensions,
    home-manager,
    hyprland,
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
      inherit hyprland;
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
