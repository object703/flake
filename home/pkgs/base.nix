{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # applications
    thunderbird
    libreoffice
    qbittorrent
    keepassxc
    kmymoney
    syncthing
    vscode-fhs

    # utils
    htop
    rclone
    whois
    fastfetch


    # media
    mpv
    strawberry
  ];
}
