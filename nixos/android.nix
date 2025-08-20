{ lib, pkgs, ... }:

{
  programs.adb.enable = true;
  users.users.gary.extraGroups = [ "kvm" "adbusers" ];
  environment.systemPackages = [ pkgs.android-studio ];
}
