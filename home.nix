{ config, pkgs, lib, ... }:

{
  home.username = "gary";
  home.homeDirectory = "/home/gary";

  home.stateVersion = "25.05";
  home.packages = [
    pkgs.wayland-utils
    pkgs.wl-clipboard

    pkgs.mpv
    pkgs.keepassxc
    pkgs.kmymoney
    pkgs.thunderbird
    pkgs.yt-dlp
    pkgs.neofetch

    # unfree
    pkgs.vscode
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.git = {
    enable = true;
    userName = "gary";
    userEmail = "git@hyperion.me.uk";

    extraConfig = {
      core.editor = "vim";
      init.defaultBranch = "master";
    };
  };
}
