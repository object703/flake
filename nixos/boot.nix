{ pkgs, ... }:

{
  boot = {
    # the default kernel for nixos is the lts kernel (pkgs.linuxPackages)
    # kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    tmp.cleanOnBoot = true;
  };
}
