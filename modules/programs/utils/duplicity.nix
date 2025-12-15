# Enable duplicity for backing up files.
# https://duplicity.gitlab.io/
# https://search.nixos.org/options?channel=unstable&query=duplicity

{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.c-opt.programs.utils.duplicity.enable {
    services.duplicity = {
      enable = true;
      frequency = null;
    };
  };
}
