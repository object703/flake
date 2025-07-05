{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "gary";
    userEmail = "git@hyperion.me.uk";

    extraConfig = {
      core.editor = "vim";
      init.defaultBranch = "master";
    };
  };
}
