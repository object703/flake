{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # applications
    brave
    thunderbird
    qbittorrent
    keepassxc
    kmymoney
    syncthing
    vscode-fhs
    inkscape
    mpv
    strawberry
    obsidian
    dbeaver-bin
    gimp3
    freerdp

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
