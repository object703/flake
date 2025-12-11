{ lib, pkgs,  ... }:

{
  programs.adb.enable = true;
  users.users.gary.extraGroups = [ "kvm" "adbusers" ];
  environment.systemPackages = [
    pkgs.android-studio-full
    pkgs.androidenv.androidPkgs.androidsdk
    #pkgs.androidenv.androidPkgs.all.system-images.v36x.google_apis_playstore.x86_64
  ];
  nixpkgs.config.android_sdk.accept_license = true;
}
