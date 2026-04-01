# nix-niri

NixOS configuration using the **dendritic pattern** with Niri compositor, Noctalia Shell, and a TempleOS-inspired theme.

Based on [vimjoyer's](https://www.youtube.com/@vimjoyer) video: [Ultimate NixOS Desktop: Niri, Noctalia Shell, and the Dendritic Pattern](https://www.youtube.com/watch?v=aNgujRXDTdE)

## What's inside

- **Niri** — scrollable tiling Wayland compositor with vim keybinds (hjkl)
- **Noctalia Shell** — desktop shell (bar, app launcher, notifications)
- **Stylix** — system-wide TempleOS theme (CGA 16-color, Cozette bitmap font, light polarity, slight transparency)
- **wlr-which-key** — vim-style key chord menus for launching apps, power actions, screenshots
- **Ghostty** — terminal emulator
- **Fish** — shell

## Setup guide

### Prerequisites

- A PC with a fresh NixOS installation (minimal or graphical ISO, doesn't matter)
- Internet connection
- A GitHub SSH key on the machine (or use HTTPS clone)

### Step 1: Install NixOS with the default installer

Boot the NixOS ISO, run through the installer, and reboot into the default desktop. This gives you a working system with a `hardware-configuration.nix` that matches your actual hardware.

### Step 2: Clone this repo

```bash
nix-shell -p git
git clone git@github.com:NakedGunGuy/nix-niri.git ~/nixos
cd ~/nixos
```

### Step 3: Replace the hardware configuration

The default NixOS installer generated a hardware config for your machine at `/etc/nixos/hardware-configuration.nix`. Copy it into this repo, replacing the placeholder:

```bash
cp /etc/nixos/hardware-configuration.nix ~/nixos/nixos/hosts/main/hardware-configuration.nix
```

This file contains your specific disk layout, kernel modules, and firmware settings. **Do not edit it manually** — it's auto-generated for your hardware.

If for some reason the file doesn't exist, regenerate it:

```bash
sudo nixos-generate-config --show-hardware-config > ~/nixos/nixos/hosts/main/hardware-configuration.nix
```

### Step 4: Add a wallpaper

Place a wallpaper image somewhere on the system:

```bash
cp /path/to/your/wallpaper.png ~/.wallpaper
```

Then edit `theme.nix` and uncomment the wallpaper line:

```nix
# Change this:
# image = /path/to/wallpaper.png;

# To this (use an absolute path):
image = /home/perko/.wallpaper;
```

Stylix **requires** a wallpaper image — the build will fail without it.

### Step 5: Build and switch

```bash
sudo nixos-rebuild switch --flake ~/nixos#main
```

This will download all packages, build the system, and switch to it. The first build takes a while.

### Step 6: Reboot

```bash
reboot
```

You'll boot into Niri with the Noctalia Shell bar on the left and the TempleOS theme applied everywhere.

## Adding a second machine

1. Create a new directory: `nixos/hosts/myhost/`
2. Copy your hardware config there:
   ```bash
   sudo nixos-generate-config --show-hardware-config > ~/nixos/nixos/hosts/myhost/hardware-configuration.nix
   ```
3. Create `nixos/hosts/myhost/configuration.nix`:
   ```nix
   {self, ...}: {
     flake.nixosConfigurations.myhost = self.inputs.nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [
         self.nixosModules.base
         self.nixosModules.desktop
         self.nixosModules.pipewire
         self.nixosModules.networking
         ./hardware-configuration.nix
       ];
     };
   }
   ```
4. Build with: `sudo nixos-rebuild switch --flake ~/nixos#myhost`

The dendritic pattern auto-imports the new files — no need to register them anywhere.

## Keybindings

### Window management (Niri)

| Binding | Action |
|---------|--------|
| `Super+Return` | Open terminal (Ghostty) |
| `Super+Q` | Close window |
| `Super+F` | Maximize column |
| `Super+Shift+F` | Fullscreen window |
| `Super+H/J/K/L` | Focus left/down/up/right |
| `Super+Shift+H/J/K/L` | Move window left/down/up/right |
| `Super+1-0` | Switch to workspace 1-10 |
| `Super+Shift+1-0` | Move window to workspace 1-10 |
| `Print` | Screenshot region to clipboard |

### Which-key menus (press leader, then a key)

| Leader | Menu | Keys |
|--------|------|------|
| `Super+D` | **Apps** | `b`=Browser, `d`=Discord, `t`=Terminal, `f`=File Manager, `m`=Spotify, `o`=Obsidian, `h`=Btop |
| `Super+P` | **Power** | `s`=Suspend, `r`=Reboot, `o`=Shutdown, `l`=Lock, `e`=Logout |
| `Super+X` | **Screenshot** | `s`=Select to clipboard, `f`=Full to clipboard, `e`=Select + edit, `w`=Save to file |

### Other

| Binding | Action |
|---------|--------|
| `Super+S` | Noctalia app launcher |
| Media keys | Volume, brightness, play/pause |

## Updating

```bash
cd ~/nixos
nix flake update              # Update all flake inputs
sudo nixos-rebuild switch --flake .#main
```

To update a single input:

```bash
nix flake update nixpkgs
```

## Project structure

```
flake.nix                              # Entry point — auto-imports all .nix files
parts.nix                              # flake-parts + wrapper-modules setup
theme.nix                              # Stylix TempleOS theme + color definitions
nixos/
  base/
    base.nix                           # User, packages, SSH, Bluetooth, Printing, Docker, MPD
    networking.nix                     # NetworkManager, firewall
  features/
    desktop.nix                        # Niri, Noctalia, all apps
    pipewire.nix                       # Audio
  hosts/
    main/
      configuration.nix                # Host config — composes modules
      hardware-configuration.nix       # Machine-specific (replace this!)
wrappedPrograms/
  niri.nix                             # Compositor keybinds, layout, workspaces
  noctalia/noctalia.nix                # Bar, launcher, notification settings
  terminal.nix                         # Ghostty config
  which-key.nix                        # Vim chord menus
```

Every `.nix` file (except `flake.nix`) is automatically imported as a flake-parts module. To add a feature, just create a new `.nix` file anywhere in the repo.

## Credits

- [vimjoyer](https://www.youtube.com/@vimjoyer) — NixOS videos and the nixconf this is based on
- [Dendritic pattern](https://github.com/mightyiam/dendritic) — the module architecture
- [Niri](https://github.com/YaLTeR/niri) — scrollable tiling compositor
- [Noctalia Shell](https://docs.noctalia.dev/) — desktop shell
- [wlr-which-key](https://github.com/MaxVerevkin/wlr-which-key) — key chord menus
- [Stylix](https://github.com/nix-community/stylix) — system-wide theming
