{ inputs, pkgs, ... }:

{
  networking.hostName = "triton";

  imports = [
    ./hardware-configuration.nix

    ../../users/gary.nix

    ../../nixos/bluetooth.nix
    ../../nixos/games.nix
    ../../nixos/kde.nix
    ../../nixos/mouse.nix
    ../../nixos/networkmanager.nix
    ../../nixos/server.nix
  ];

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-bak";
    extraSpecialArgs = { inherit inputs; };
    users.gary = {
      imports = [
        ../../home/pkgs/firefox.nix
        ../../home/pkgs/git.nix
        ../../home/pkgs/zsh.nix
      ];
      home = {
        homeDirectory = "/home/gary";
        packages = with pkgs; [
          # applications
          thunderbird
          libreoffice
          qbittorrent
          keepassxc
          kmymoney
          syncthing

          # utils
          rclone
          whois
          fastfetch

          # media
          mpv
          strawberry

          # langs
          ocaml
          python3
        ];

        stateVersion = "25.05";
      };

      programs.home-manager.enable = true;
    };
  };

  system.stateVersion = "25.05";
}
