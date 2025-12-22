{ config, lib, ... }:
{
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "${config.c-opt.user.fullName}";
        email = "${config.c-opt.user.email}";
      };
    };
  };
}
