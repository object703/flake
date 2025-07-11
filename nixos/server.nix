{ ... }:

{
  console.font = "Lat2-Terminus16";
  
  services = {
    openssh.enable = true;
    printing.enable = true;

    syncthing = {
      enable = true;
      openDefaultPorts = true;
      extraFlags = [ "--no-default-folder" ];

      # tidy this up
      configDir = "/home/gary/.config/syncthing";
      user = "gary";
    };
  };
}
