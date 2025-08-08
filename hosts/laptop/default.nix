{ inputs, pkgs, ... }:

{
  networking.hostName = "titania";
  boot.initrd.luks.devices."crypt".device = "/dev/disk/by-label/crypt";

  imports = [
    ./hardware-configuration.nix

    ../../users/gary.nix

    ../../nixos/boot.nix
    ../../nixos/locale.nix
    ../../nixos/nix.nix
    ../../nixos/security.nix
    ../../nixos/server.nix
    ../../nixos/shell.nix

    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/display.nix
    ../../nixos/fonts.nix
    ../../nixos/games.nix
    ../../nixos/mouse.nix
    ../../nixos/networkmanager.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
    extraSpecialArgs = { inherit inputs; };
    users.gary = {
      imports = [
        ../../home/xdg.nix
        ../../home/pkgs/base.nix
        ../../home/pkgs/firefox.nix
        ../../home/pkgs/git.nix
      ];

      home = {
        homeDirectory = "/home/gary";
        stateVersion = "25.05";
      };

      programs.home-manager.enable = true;
    };
  };

  system.stateVersion = "25.05";
}
