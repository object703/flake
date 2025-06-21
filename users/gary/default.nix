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
      stateVersion = "25.05";
      sessionVariables.EDITOR = "vim";
    };
  };
}
