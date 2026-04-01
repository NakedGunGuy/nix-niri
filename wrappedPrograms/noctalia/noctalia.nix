# Noctalia Shell configuration via wrapper-modules
{self, ...}: {
  # Build wrapped Noctalia Shell package
  perSystem = {pkgs, ...}: {
    packages.noctalia-shell = self.inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      package = pkgs.noctalia-shell;
      env = {
        "NOCTALIA_CACHE_DIR" = "/tmp/noctalia-cache/";
      };
      colors = let
        t = self.theme;
      in {
        primary = t.blue;
        secondary = t.cyan;
        accent = t.bright-blue;
        background = t.bg;
        surface = t.silver;
        on-primary = t.bg;
        on-background = t.fg;
        on-surface = t.fg;
        outline = t.border;
        error = t.red;
      };
      settings = {
        bar = {
          position = "left";
          widgets = {
            left = ["ControlCenter" "Workspace"];
            right = ["Clock" "Tray" "Battery" "Volume" "Network"];
          };
        };

        launcher = {
          position = "center";
          icon-mode = "tabler";
          view-mode = "list";
          sort = "most-used";
        };

        notifications = {
          position = "top_right";
          layer = "overlay";
        };

        dock.enable = false;
        wallpaper-engine.enable = false;
        desktop-widgets.enable = false;
      };
    };
  };
}
