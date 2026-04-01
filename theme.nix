# TempleOS-inspired theme via Stylix
# Light background, CGA 16-color palette, Cozette bitmap font, slight transparency
{self, ...}: {
  flake.nixosModules.stylix-theme = {pkgs, ...}: {
    imports = [
      self.inputs.stylix.nixosModules.stylix
    ];

    stylix = {
      enable = true;
      polarity = "light";

      # TempleOS-style wallpaper — replace with your own
      # image = /path/to/wallpaper.png;

      # CGA/EGA 16-color palette
      base16Scheme = {
        slug = "templeos";
        name = "TempleOS";
        author = "Inspired by Terry Davis";
        base00 = "FFFFFF"; # background — white
        base01 = "C0C0C0"; # lighter bg — silver
        base02 = "AAAAAA"; # selection
        base03 = "555555"; # comments/muted
        base04 = "333333"; # dark gray
        base05 = "000000"; # foreground — black
        base06 = "1A1A1A"; # near-black
        base07 = "000000"; # bright foreground
        base08 = "AA0000"; # red
        base09 = "AA5500"; # orange/brown
        base0A = "AA5500"; # yellow (CGA yellow = brown)
        base0B = "00AA00"; # green
        base0C = "00AAAA"; # cyan
        base0D = "0000AA"; # blue — the iconic TempleOS blue
        base0E = "AA00AA"; # magenta
        base0F = "5555FF"; # bright blue
      };

      # Cozette bitmap font everywhere for maximum retro
      fonts = {
        monospace = {
          package = pkgs.cozette;
          name = "Cozette";
        };
        sansSerif = {
          package = pkgs.cozette;
          name = "Cozette";
        };
        serif = {
          package = pkgs.cozette;
          name = "Cozette";
        };
        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
        sizes = {
          applications = 13;
          desktop = 11;
          terminal = 13;
          popups = 12;
        };
      };

      # Slight transparency so wallpaper bleeds through
      opacity = {
        terminal = 0.85;
        desktop = 0.90;
        applications = 0.92;
        popups = 0.95;
      };

      # Retro cursor
      cursor = {
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ";
        size = 24;
      };
    };
  };

  # Keep a flake-level color reference for wrapper-modules (Noctalia, Niri)
  # that can't read Stylix options directly
  flake.theme = {
    bg = "#FFFFFF";
    fg = "#000000";
    red = "#AA0000";
    green = "#00AA00";
    yellow = "#AA5500";
    blue = "#0000AA";
    purple = "#AA00AA";
    cyan = "#00AAAA";
    orange = "#AA5500";
    gray = "#555555";
    silver = "#C0C0C0";
    bg-dim = "#AAAAAA";
    bg-light = "#C0C0C0";
    border = "#555555";
    bright-blue = "#5555FF";
  };
}
