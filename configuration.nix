# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.tmp.cleanOnBoot = true;
  boot.initrd.luks.devices."crypt".device = "/dev/disk/by-label/crypt";
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix = {
    settings.experimental-features =["nix-command" "flakes"];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  networking.hostName = "laptop"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "gb";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "gary";
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "gb";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.openssh.enable = true;
  services.libinput.enable = true;

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gary = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  programs.firefox = {
    enable = true;
  };


  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    gnupg
    git
    zsh
    vim

    # monitoring
    htop
    nload
    lm_sensors
  ];

  # Enable the OpenSSH daemon.

  # TODO: is it possible to whitelist selected pkgs
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
