{ pkgs, ... }:

{
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
}
