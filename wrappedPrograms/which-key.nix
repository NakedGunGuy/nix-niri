# wlr-which-key: vim-style key chord menus for Wayland
# Based on vimjoyer's video: https://www.youtube.com/watch?v=jhIr9VN2znI
# Creates a mkMenu function that generates wlr-which-key YAML configs
# and wraps them as executable packages
{self, ...}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    t = self.theme;

    # mkMenu: takes a menu definition (list of {key, desc, cmd/submenu})
    # and produces a package that runs wlr-which-key with that config
    mkMenu = menu: let
      config = {
        font = "Cozette 13";
        background = "${t.bg}e6"; # white with slight transparency
        color = t.fg;
        border = t.blue;
        separator = " > ";
        border_width = 2;
        corner_r = 0; # TempleOS — no rounding
        padding = 10;
        anchor = "center";
        inherit menu;
      };
      configFile = pkgs.writeText "wlr-which-key.yaml" (lib.generators.toYAML {} config);
    in
      pkgs.writeShellScriptBin "wlr-which-key-menu" ''
        ${lib.getExe pkgs.wlr-which-key} ${configFile}
      '';

    # App launcher menu: Super+D then a letter
    appMenu = mkMenu [
      {key = "b"; desc = "Browser (Chromium)"; cmd = "chromium";}
      {key = "d"; desc = "Discord"; cmd = "discord";}
      {key = "t"; desc = "Terminal"; cmd = "ghostty";}
      {key = "f"; desc = "File Manager"; cmd = "thunar";}
      {key = "m"; desc = "Music"; cmd = "spotify";}
      {key = "o"; desc = "Obsidian"; cmd = "obsidian";}
      {key = "h"; desc = "Btop"; cmd = "ghostty -e btop";}
    ];

    # Power menu: Super+P then a letter
    powerMenu = mkMenu [
      {key = "s"; desc = "Suspend"; cmd = "systemctl suspend";}
      {key = "r"; desc = "Reboot"; cmd = "systemctl reboot";}
      {key = "o"; desc = "Shutdown"; cmd = "systemctl poweroff";}
      {key = "l"; desc = "Lock"; cmd = "swaylock -f";}
      {key = "e"; desc = "Logout"; cmd = "loginctl terminate-session self";}
    ];

    # Screenshot menu: Super+X then a letter
    screenshotMenu = mkMenu [
      {key = "s"; desc = "Select to Clipboard"; cmd = "grim -g \"$(slurp)\" - | wl-copy";}
      {key = "f"; desc = "Full to Clipboard"; cmd = "grim - | wl-copy";}
      {key = "e"; desc = "Select + Edit"; cmd = "grim -g \"$(slurp)\" - | swappy -f -";}
      {key = "w"; desc = "Save to File"; cmd = "grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%s).png";}
    ];
  in {
    packages = {
      which-key-apps = appMenu;
      which-key-power = powerMenu;
      which-key-screenshot = screenshotMenu;
    };
  };
}
