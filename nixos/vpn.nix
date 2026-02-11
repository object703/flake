{ pkgs, ... }:

{
  services = {
    # mullvad-vpn = {
    #   enable = true;
    #   package = pkgs.mullvad-vpn;
    # };

    # https://discourse.nixos.org/t/connected-to-mullvadvpn-but-no-internet-connection/35803/7?u=lion
    #resolved.enable = true;
  };
}
