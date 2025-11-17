# Loads the modules that define custom config
# options for the user and os.

{
  imports = [
    ./desktop-env.nix
    ./hardware.nix
    ./impermanence.nix
    ./os.nix
    ./programs.nix
    ./theme.nix
    ./user.nix
  ];
}
