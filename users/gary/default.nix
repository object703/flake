{ pkgs, ... }:

{
  users.users.gary = {
    description = "Gary";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  home-manager.users.gary = { pkgs, ... }: {
    home = {
      stateVersion = "25.05";
      username = "gary";
      homeDirectory = "/home/gary";
      sessionVariables.EDITOR = "vim";

      packages = with pkgs; [
        # applications
        thunderbird
        libreoffice
        qbittorrent
        kmymoney

        # media
        haruna # mpv frontend
        strawberry # music player
        keepassxc
        qbittorrent
        haruna

        # development
        nil # nix lsp
        vscode-fhs

        #misc
        neofetch
        whois
      ];
    };

    programs.firefox = {
      enable = true;
      package = pkgs.firefox-esr;
      languagePacks = [ "en-GB" ];
      profiles = {
        default = {
          isDefault = true;
          settings = {
            # kde integration
            "widget.use-xdg-desktop-portal.file-picker" = 1;
            "widget.use-xdg-desktop-portal.location" = 1;
            "widget.use-xdg-desktop-portal.mime-handler" = 1;
            # disable ai
            "browser.ml.enable" = false;
            "browser.ml.checkForMemory" = false;
            "browser.ml.defaultModelMemoryUsage" = 0;
            "browser.ml.logLevel" = "";
            "browser.ml.maximumMemoryPressure" = 0;
            "browser.ml.minimumPhysicalMemory" = 0;
            "browser.ml.modelCacheMaxSize" = 0;
            "browser.ml.modelCacheTimeout" = 0;
            "browser.ml.modelHubRootUrl" = "";
            "browser.ml.modelHubUrlTemplate" = "";
            "browser.ml.queueWaitInterval" = 0;
            "browser.ml.queueWaitTimeout" = 0;
            "browser.ml.chat.enabled" = false;
            "browser.ml.chat.hideFromLabs" = true;
            "browser.ml.chat.hideFromLabsShortcuts" = true;
            "browser.ml.chat.hideLocalhost" = true;
            "browser.ml.chat.prompt.prefix" = "";
            "browser.ml.chat.prompts.0" = "";
            "browser.ml.chat.prompts.1" = "";
            "browser.ml.chat.prompts.2" = "";
            "browser.ml.chat.prompts.3" = "";
            "browser.ml.chat.prompts.4" = "";
            "browser.ml.chat.provider" = "";
            "browser.ml.chat.shortcuts.custom" = false;
            "browser.ml.chat.shortcuts.longPress" = -1;
            "browser.ml.chat.shortcuts" = false;
            "browser.ml.chat.sidebar" = false;
            "browser.ml.overridePipelineOptions" = { };
            # disable "ai" link previews
            "browser.ml.linkPreview.enabled" = false;
            "browser.ml.linkPreview.blockListEnabled" = false;
            "browser.ml.linkPreview.allowedLanguages" = "";
            "browser.ml.linkPreview.noKeyPointsRegions" = "";
            "browser.ml.linkPreview.outputSentences" = -1;
            "browser.ml.linkPreview.outputSchemes" = -1;
            # disable the "more from mozilla" section in settings
            "browser.preferences.moreFromMozilla" = false;

          };
        };
      };
    };

#     programs.thunderbird = {
#       enable = true;
#     };

    programs.git = {
      enable = true;
      userName = "gary";
      userEmail = "git@hyperion.me.uk";

      extraConfig = {
        core.editor = "vim";
        init.defaultBranch = "master";
      };
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {


        mkdir = "mkdir -v";
        rmdir = "rmdir -v";
        mv = "mv -v";
        cp = "cp -v";

        ll = "ls -l";
        edit = "sudo -e";
        update = "sudo nixos-rebuild switch";
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
      history.ignorePatterns = ["rm *" "pkill *" "cp *"];
    };


    programs.home-manager.enable = true;
  };
}
