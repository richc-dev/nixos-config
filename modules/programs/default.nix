{
  imports = [
    ./games
    ./utils
    ./audio-video-progs.nix
    ./browsers.nix
    ./dev-tools.nix
    ./librewolf.nix
    ./packages.nix
    ./vscode.nix
  ];

  c-opt = {
    audio-video-progs.enable = true;
    browsers = {
      enable = true;
      librewolf.enable = true;
    };
    dev-tools.enable = true;
    vscodium.enable = true;
  };
}
