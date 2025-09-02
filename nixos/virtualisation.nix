{ ... };

{
   users.extraGroups.vboxusers.members = [ "gary" ];
   virtualisation.virtualbox.host.enable = true;
   virtualisation.virtualbox.host.enableExtensionPack = true;
}