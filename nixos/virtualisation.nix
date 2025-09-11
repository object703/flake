{ ... }:

{
   users.users.gary.extraGroups = [ "podman" ];
   users.extraGroups.vboxusers.members = [ "gary" ];

   virtualisation = {
      podman = {
         enable = true;
         dockerCompat = true;
         defaultNetwork.settings.dns_enabled = true;
      };

      virtualbox= {
         host.enable = true;
         host.enableExtensionPack = true;
      };
   };
}