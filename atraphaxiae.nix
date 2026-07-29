{ config, pkgs, ... }:

{
  home = {
    stateVersion = "26.05";
    
    username = "atraphaxiae";
    homeDirectory = "/home/atraphaxiae";
  };

  programs.git = {
    enable = true;
    signing = {
      key = "07CE2301AB14BC88";
      signByDefault = true;
    };
    settings = {
      user.name = "Nile Jocson";
      user.email = "atraphaxiae@gmail.com";
      init.defaultBranch = "main";
    };
  };
}
