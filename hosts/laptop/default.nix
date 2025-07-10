{ pkgs, ... }:

{
  networking.hostName = "titania";

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

  home-manager.users.gary = import ../../home/graphical.nix;

  system.stateVersion = "25.05";
}
