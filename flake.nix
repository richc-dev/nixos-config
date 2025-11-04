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

    # Home Manager doesn't generate the configs when using `nixos-rebuid boot`
    # command. And yes, I am an IDIOT and spent hours trying to figure out
    # why Home Manager wasn't applying configs.
    # https://github.com/nix-community/home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    # https://hypr.land
    hyprland.url = "github:hyprwm/Hyprland";

    # Noctalia shell
    # https://github.com/noctalia-dev/noctalia-shell
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };

    # Quickshell (required for Noctalia)
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Sops-nix
    # https://github.com/Mic92/sops-nix
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    # https://github.com/nix-community/stylix
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nix-vscode-extensions,
    home-manager,
    hyprland,
    noctalia,
    quickshell,
    sops-nix,
    stylix
  }@inputs:
  let
    # Modules shared between all systems.
    sharedModules = [
      home-manager.nixosModules.home-manager
      sops-nix.nixosModules.sops
      stylix.nixosModules.stylix

      ./config
      ./modules
    ];
  in
  {
    nixosConfigurations = {
      # Laptop config.
      rcc-laptop =
      let
        system = "x86_64-linux";

        # Add stable nix packages channel.
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };

        # Args passed to NixOS modules
        specialArgs = {
          inherit hyprland;
          inherit pkgs-stable;
          inherit nix-vscode-extensions;
          inherit noctalia;
          inherit sops-nix;
        };
      in
      nixpkgs.lib.nixosSystem {
        system = system;
        inherit specialArgs;

        modules = sharedModules ++ [
          ./hosts/rcc-laptop
        ];
      };

    };
  };
}
