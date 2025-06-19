{ config, pkgs, lib, ... }:

{
  users.users.gary = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.gary = {
    home = {
      username = "gary";
      homeDirectory = "/home/gary";
      sessionVariables.EDITOR = "vim";
    };
  };
}
