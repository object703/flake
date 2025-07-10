{ pkgs, ... }:

{
  networking.hostName = "triton";

  imports = [
    ./hardware-configuration.nix

    ../../users/gary.nix
    ../../home/graphical.nix

    ../../nixos/bluetooth.nix
    ../../nixos/games.nix
    ../../nixos/home-manager.nix
    ../../nixos/kde.nix
    ../../nixos/locale.nix
    ../../nixos/mouse.nix
    ../../nixos/networkmanager.nix
    ../../nixos/server.nix
  ];

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
  };

  home-manager.users.gary = import ./home.nix;

  system.stateVersion = "25.05";
}
