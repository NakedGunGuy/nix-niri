# Audio via PipeWire
_: {
  flake.nixosModules.pipewire = {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    # Disable PulseAudio (replaced by PipeWire)
    services.pulseaudio.enable = false;
  };
}
