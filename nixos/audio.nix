{ ... }:

{
  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    pulseaudio.enable = false;
  };
}
