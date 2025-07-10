{
  description = "personal nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }: let
    common = {pkgs, home-manager, ... }: {
      # nix things
      nix.settings.experimental-features = [ "nix-command" "flakes"];
      nix.settings.auto-optimise-store = true;
      nix.gc.automatic = true;
      nix.gc.dates = "weekly";
      nix.gc.options = "--delete-older-than 14d";
      nixpkgs.config.allowUnfree = true;

      # kernel/bootloader
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.timeout = 3;
      boot.tmp.cleanOnBoot = true;

      # locale
      time.timeZone = "Europe/London";
      i18n.defaultLocale = "en_GB.UTF-8";
      services.xserver.xkb.layout = "gb";
      console.useXkbConfig = true;

      # shell
      programs.zsh.enable = true;
      users.defaultUserShell = pkgs.zsh;

      # security
      security.sudo.enable = false;
      security.doas.enable = true;
      security.doas.wheelNeedsPassword = false;

      # programs
      environment.systemPackages = with pkgs; [
        wget curl vim git htop
      ];

    };
    in {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs= { inherit inputs; };
          modules = [
            common
            home-manager.nixosModules.home-manager
            ./hosts/desktop
          ];
        };
      };
  };
}
