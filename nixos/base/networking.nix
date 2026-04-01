# Networking module
_: {
  flake.nixosModules.networking = {
    networking = {
      hostName = "nixos-main";
      networkmanager.enable = true;
    };

    # Firewall
    networking.firewall.enable = true;
  };
}
