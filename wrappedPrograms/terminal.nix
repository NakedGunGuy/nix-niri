# Terminal emulator (Ghostty)
# Colors are handled by Stylix — only set font and behavior here
{self, ...}: {
  perSystem = {pkgs, ...}: {
    packages.terminal = self.inputs.wrapper-modules.wrappers.ghostty.wrap {
      inherit pkgs;
      settings = {
        font-family = "Cozette";
        font-size = 13;
        cursor-style = "block";
        window-padding-x = 2;
        window-padding-y = 2;
        confirm-close-surface = false;
      };
    };
  };
}
