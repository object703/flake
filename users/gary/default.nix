{ pkgs, lib, ... }:
let
  username = "gary";
in
{
  users.users.${username} = {
    description = "${lib.toSentenceCase username}";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  home-manager.users.${username} = { pkgs, ... }: {

    home = {
      stateVersion = "25.05";
      username = "${username}";
      homeDirectory = "/home/${username}";
      sessionVariables.EDITOR = "vim";

      packages = with pkgs; [
        # applications
        thunderbird
        libreoffice
        qbittorrent
        kmymoney
        keepassxc

        # media
        mpv # mpv frontend
        strawberry # music player
        qbittorrent

        # development
        nil # nix lsp
        vscode-fhs

        #misc
        neofetch
        htop
        whois
        rclone
      ];
    };

    imports = [
      ./pkgs/firefox.nix
      ./pkgs/git.nix
      ./pkgs/zsh.nix
    ];

    programs.home-manager.enable = true;
  };
}
