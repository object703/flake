{ pkgs, ... }:

{
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
}
