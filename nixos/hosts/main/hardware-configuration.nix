# Hardware configuration — replace with output of `nixos-generate-config --show-hardware-config`
{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # TODO: Replace with your actual hardware config
  # Run: nixos-generate-config --show-hardware-config
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod"];
  boot.kernelModules = ["kvm-intel"];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
