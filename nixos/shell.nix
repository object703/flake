{ pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    histSize = 100000;
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
      "SHARE_HISTORY"
      "HIST_FCNTL_LOCK"
      "HIST_REDUCE_BLANKS"
      "EXTENDED_HISTORY"
    ];

    promptInit = ''
      autoload -Uz compinit promptinit
      compinit
      autoload -Uz colors && colors
      prompt_gentoo_setup () {
        local prompt_gentoo_prompt=''${1:-"blue"}
        local prompt_gentoo_user=''${2:-"green"}
        local prompt_gentoo_root=''${3:-"red"}

        if [ "$EUID" = "0" ]
        then
          local base_prompt="%B%F{$prompt_gentoo_root}%m%k "
        else
          local base_prompt="%B%F{$prompt_gentoo_user}%n@%m%k "
        fi
        local post_prompt="%b%f%k"

        #setopt noxtrace localoptions

        local path_prompt="%B%F{$prompt_gentoo_prompt}%1~"
        typeset -g PS1="$base_prompt$path_prompt %# $post_prompt"
        typeset -g PS2="$base_prompt$path_prompt %_> $post_prompt"
        typeset -g PS3="$base_prompt$path_prompt ?# $post_prompt"
      }

      prompt_gentoo_setup "$@"

      case $TERM in
        xterm*)
          precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
        esac
      '';

    shellAliases = {
      mkdir = "mkdir -v";
      rmdir = "rmdir -v";
      mv = "mv -v";
      cp = "cp -v";

      ll = "ls -l";
    };
  };
}
