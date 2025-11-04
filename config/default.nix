# Loads the modules that define custom config
# options for the user and os.

{
  imports = [
    ./desktop-env.nix
    ./impermanence.nix
    ./os.nix
    ./theme.nix
    ./user.nix
  ];
}
