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
    mpv
    strawberry

    # utils
    wget
    curl
    yt-dlp
    file
    p7zip
    ffmpeg
    imagemagick
    htop
    rclone
    whois
    fastfetch
    tree
  ];
}
