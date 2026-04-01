# Host-specific NixOS configuration for "main"
{self, ...}: {
  flake.nixosConfigurations.main = self.inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.base
      self.nixosModules.desktop
      self.nixosModules.pipewire
      self.nixosModules.networking
      ./hardware-configuration.nix
      # ./disko.nix  # Uncomment when disko is configured
    ];
  };
}
