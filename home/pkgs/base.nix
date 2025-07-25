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
    inkscape

    # utils
    htop
    rclone
    whois
    fastfetch
    tree

    # media
    mpv
    strawberry
  ];
}
