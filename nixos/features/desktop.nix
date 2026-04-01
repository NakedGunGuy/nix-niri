# Desktop feature: Niri compositor + Noctalia Shell
{self, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.system}";
  in {
    imports = [
      self.nixosModules.pipewire
      self.nixosModules.stylix-theme
    ];

    # Niri scrollable tiling Wayland compositor
    programs.niri.enable = true;
    programs.niri.package = selfpkgs.niri;

    # Noctalia desktop shell (bar, launcher, notifications)
    environment.systemPackages = with pkgs; [
      selfpkgs.noctalia-shell
      selfpkgs.terminal

      # Browsers
      chromium
      firefox
      brave

      # Apps
      discord
      spotify
      obsidian
      slack
      obs-studio
      vlc
      rmpc
      gimp
      libreoffice

      # Dev tools
      neovim
      lazygit
      lazydocker
      docker-compose
      ddev
      nodejs
      nodePackages.pnpm
      php
      phpPackages.composer
      python3
      postman
      dbeaver-bin
      jetbrains.phpstorm
      filezilla
      meld

      # Desktop utilities
      xfce.thunar
      yazi
      swaybg
      grim
      slurp
      swappy         # Screenshot annotation
      wl-clipboard
      brightnessctl
      playerctl
      wlr-which-key
      swaylock       # Screen lock
    ];

    # Set Chromium as default browser
    xdg.mime.defaultApplications = {
      "text/html" = "chromium-browser.desktop";
      "x-scheme-handler/http" = "chromium-browser.desktop";
      "x-scheme-handler/https" = "chromium-browser.desktop";
    };

    # Fonts — Cozette for retro look, Noto for emoji/CJK fallback
    fonts.packages = with pkgs; [
      cozette
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];

    # XDG portal for Wayland
    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gnome];
    };

    # Graphics
    hardware.graphics.enable = true;

    # Seat management
    services.seatd.enable = true;
  };
}
