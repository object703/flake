{ config, lib, pkgs, inputs, vars, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../users/gary
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;
    };

    tmp.cleanOnBoot = true;
    initrd.luks.devices."crypt".device = "/dev/disk/by-label/crypt";
  };

  # Locale
  time.timeZone = "Europe/London";
    language = "en_GB.UTF-8";
    units = "en_GB.UTF-8";
    layout = "gb";

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  # Packages
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    overrides.global.Context.sockets = ["wayland" "!x11" "!fallback-x11"];
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.steam.enable = true;
  programs.firefox = true;

  # Services
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "gary";
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
    };

    libinput = {
      enable = true;
      mouse = {
        accelSpeed = "0";
        accelProfile = "flat";
        middleEmulation = false;
        tappingDragLock = false;
        tapping = false;
      }
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    pulseaudio.enable = false;

    openssh.enable = true;
    printing.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimize-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
  nixpkgs.config.allowUnfree = true;


  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  # Other packages


  environment.systemPackages = with pkgs; [
    wget
    curl

    vim
    git
    gnupg
  ];
}
