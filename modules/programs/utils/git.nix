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
      sendemail = {
        smtpserver = "richc.dev";
        smtpuser = "rcc@richc.dev";
        smtpencryption = "ssl";
        smtpserverport = 465;
      };
      credential = {
        helper = "cache --timeout 1800";
      };
    };
  };
}
