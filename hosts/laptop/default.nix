{ config, lib, pkgs, inputs, home-manager, vars, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../users/gary
    ];

  system.stateVersion = "25.05";

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    tmp.cleanOnBoot = true;
    initrd.luks.devices."crypt".device = "/dev/disk/by-label/crypt";
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
  nixpkgs.config.allowUnfree = true;

  # Locale
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "uk";
  };

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  # Services
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;
    displayManager = {
      autoLogin.enable = true;
      autoLogin.user = "gary";
      sddm.enable = true;
      sddm.wayland.enable = true;
    };

    libinput = {
      enable = true;
      mouse = {
        accelSpeed = "0";
        accelProfile = "flat";
        middleEmulation = false;
        tappingDragLock = false;
        tapping = false;
      };
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    pulseaudio.enable = false;

    openssh.enable = true;
    printing.enable = true;
    flatpak.enable = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.steam.enable = true;
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    curl

    vim
    git
    gnupg
  ];

  home-manager.users.${vars.user} = {
    home.stateVersion = "25.05";
    programs.home-manager.enable = true;

  };
}
