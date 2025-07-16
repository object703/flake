{ ... }:

{
  services = {
    xserver.enable = true;
    desktopManager.plasma6.enable = true;

    displayManager = {
      autoLogin = {
        enable = true;
        user = "gary";
      };

      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
