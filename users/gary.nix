{ lib, pkgs, ... }:
let
  username = "gary";
in
{
  users.users.${username} = {
    description = "${lib.toSentenceCase username}";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
