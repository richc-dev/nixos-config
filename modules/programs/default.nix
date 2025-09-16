{
  imports = [
    ./browsers.nix
    ./vscode.nix
  ];

  c-opt = {
    browsers.enable = true;
    vscodium.enable = true;
  };
}
