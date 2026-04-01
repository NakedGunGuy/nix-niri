# Niri compositor configuration via wrapper-modules
{self, lib, ...}: {
  # Build wrapped Niri package with declarative config
  perSystem = {pkgs, ...}: {
    packages.niri = self.inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      imports = [self.wrappersModules.niri];
    };
  };

  # Niri wrapper module — declarative compositor settings
  flake.wrappersModules.niri = {config, ...}: let
    t = self.theme;
    selfpkgs = self.packages."x86_64-linux";
  in {
    input = {
      keyboard.xkb = {
        layout = "si";
        options = "caps:escape";
      };
      touchpad = {
        natural-scroll = true;
        tap = true;
      };
    };

    layout = {
      gaps = 0;
      focus-ring = {
        width = 2;
        active.color = t.blue;
        inactive.color = t.border;
      };
      border.enable = false;
    };

    # 10 named workspaces
    workspaces = builtins.listToAttrs (builtins.map (i: {
      name = "w${toString i}";
      value = {};
    }) (builtins.genList (x: x) 10));

    spawn-at-startup = [
      {command = ["noctalia-shell"];}
      {command = ["swaybg" "-m" "fill" "-i" "$HOME/.wallpaper"];}
    ];

    binds = let
      mod = "Mod";
    in {
      # App launchers
      "${mod}+Return".action.spawn = ["ghostty"];
      "${mod}+S".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];

      # Which-key chord menus (vim-style: press leader, then a key)
      "${mod}+D".action.spawn = ["${lib.getExe selfpkgs.which-key-apps}"];
      "${mod}+P".action.spawn = ["${lib.getExe selfpkgs.which-key-power}"];
      "${mod}+X".action.spawn = ["${lib.getExe selfpkgs.which-key-screenshot}"];

      # Window management
      "${mod}+Q".action = "close-window";
      "${mod}+F".action = "maximize-column";
      "${mod}+Shift+F".action = "fullscreen-window";

      # Focus
      "${mod}+H".action = "focus-column-left";
      "${mod}+J".action = "focus-window-down";
      "${mod}+K".action = "focus-window-up";
      "${mod}+L".action = "focus-column-right";

      # Move windows
      "${mod}+Shift+H".action = "move-column-left";
      "${mod}+Shift+J".action = "move-window-down";
      "${mod}+Shift+K".action = "move-window-up";
      "${mod}+Shift+L".action = "move-column-right";

      # Workspaces
      "${mod}+1".action.focus-workspace = "w0";
      "${mod}+2".action.focus-workspace = "w1";
      "${mod}+3".action.focus-workspace = "w2";
      "${mod}+4".action.focus-workspace = "w3";
      "${mod}+5".action.focus-workspace = "w4";
      "${mod}+6".action.focus-workspace = "w5";
      "${mod}+7".action.focus-workspace = "w6";
      "${mod}+8".action.focus-workspace = "w7";
      "${mod}+9".action.focus-workspace = "w8";
      "${mod}+0".action.focus-workspace = "w9";

      "${mod}+Shift+1".action.move-column-to-workspace = "w0";
      "${mod}+Shift+2".action.move-column-to-workspace = "w1";
      "${mod}+Shift+3".action.move-column-to-workspace = "w2";
      "${mod}+Shift+4".action.move-column-to-workspace = "w3";
      "${mod}+Shift+5".action.move-column-to-workspace = "w4";
      "${mod}+Shift+6".action.move-column-to-workspace = "w5";
      "${mod}+Shift+7".action.move-column-to-workspace = "w6";
      "${mod}+Shift+8".action.move-column-to-workspace = "w7";
      "${mod}+Shift+9".action.move-column-to-workspace = "w8";
      "${mod}+Shift+0".action.move-column-to-workspace = "w9";

      # Screenshots (also available via Super+X which-key menu)
      "Print".action.spawn = ["sh" "-c" "grim -g \"$(slurp)\" - | wl-copy"];

      # Media keys
      "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"];
      "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"];
      "XF86AudioMute".action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
      "XF86MonitorBrightnessUp".action.spawn = ["brightnessctl" "set" "5%+"];
      "XF86MonitorBrightnessDown".action.spawn = ["brightnessctl" "set" "5%-"];
      "XF86AudioPlay".action.spawn = ["playerctl" "play-pause"];
      "XF86AudioNext".action.spawn = ["playerctl" "next"];
      "XF86AudioPrev".action.spawn = ["playerctl" "previous"];
    };
  };
}
