{ ... }:

{
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "gary";
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
