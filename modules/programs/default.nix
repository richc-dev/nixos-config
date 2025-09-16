{
  imports = [
    ./games
    ./utils
    ./audio-video-progs.nix
    ./browsers.nix
    ./dev-tools.nix
    ./vscode.nix
  ];

  c-opt = {
    audio-video-progs = true;
    browsers.enable = true;
    vscodium.enable = true;
  };
}
