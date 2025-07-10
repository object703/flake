{ ... }:

{
  programs.steam.enable = true;

#   environment.systemPackages = with pkgs; [
#     (retroarch.withCores (cores: with cores; [
#       dolphin
#         duckstation
#         lrps2
#         melonds
#         mgba
#     ]))
#   ];
}
