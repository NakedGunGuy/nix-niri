# Core system options shared across all hosts
{self, ...}: {
  flake.nixosModules.base = {pkgs, ...}: {
    imports = [
      self.inputs.hjem.nixosModules.default
    ];

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Timezone and locale
    time.timeZone = "Europe/Ljubljana";
    i18n.defaultLocale = "en_US.UTF-8";
    console.keyMap = "si";

    # User account — adjust as needed
    users.users.perko = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "video" "audio" "docker"];
      shell = pkgs.fish;
    };

    # Essential system packages
    environment.systemPackages = with pkgs; [
      git
      curl
      wget
      htop
      fish

      # Terminal tools
      ripgrep
      fd
      fzf
      jq
      bat
      eza
      zoxide
      direnv
    ];

    programs.fish.enable = true;
    programs.direnv.enable = true;

    # SSH
    services.openssh.enable = true;
    programs.ssh.startAgent = true;

    # Bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    # Printing
    services.printing.enable = true;

    # MPD (Music Player Daemon)
    services.mpd = {
      enable = true;
      user = "perko";
      musicDirectory = "/home/perko/Music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire"
        }
      '';
    };

    # Docker
    virtualisation.docker.enable = true;

    # Enable flakes
    nix.settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "perko"];
    };

    # Allow unfree
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "25.05";
  };
}
