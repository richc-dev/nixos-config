# Loads modules needed for specific hardware.
{
  imports = [
    ./nvidia.nix
  ];

  # `c-opt` stands for "custom option".
  c-opt = {
    # Enable the Nvidia module by default
    # since all my devices have a Nvidia GPU.
    nvidia.enable = true;
  };
}
