# Vimjoyer Video Catalog

YouTube Channel: https://www.youtube.com/@vimjoyer

Vimjoyer creates educational videos about NixOS, Neovim, and Linux desktop configuration.
Each video has a companion GitHub repo at https://github.com/vimjoyer.

---

## NixOS Basics / Flakes

| Video | Repo | Description |
|-------|------|-------------|
| Ultimate NixOS Guide \| Flakes \| Home-manager | [flake-starter-config](https://github.com/vimjoyer/flake-starter-config) | Initializing a NixOS flake, setting up home-manager as a module, creating custom NixOS modules (mkEnableOption, mkOption), project structure |
| Modularizing NixOS Configuration | [modularize-video](https://github.com/vimjoyer/modularize-video) | Creating NixOS modules with mkEnableOption/mkIf, organizing flake outputs for multiple hosts, standalone vs module-based home-manager |
| Nix Shells / Development Environments | [shells2-video](https://github.com/vimjoyer/shells2-video) | nix-shell -p, nix shell, shell.nix, mkShell, flake-based devShells, environment variables, inputsFrom, shellHook |
| [Customize Nix Packages \| Overrides & Overlays](https://youtu.be/jHb7Pe7x1ZY) | [overrides-overlays-video](https://github.com/vimjoyer/overrides-overlays-video) | .override, .overrideAttrs, overlays (final/prev pattern), overrideScope, using overlays in NixOS modules |
| Fetching Files in Nix | [fetching-nix-video](https://github.com/vimjoyer/fetching-nix-video) | Fake hashes (lib.fakeHash), nurl tool for auto-generating fetchFromGitHub, fetching non-flake inputs in flakes |
| Custom NixOS ISO Installer | [custom-installer-video](https://github.com/vimjoyer/custom-installer-video) | Building custom NixOS ISOs, nixos-generators, flake-based and non-flake ISO builds |
| nh (Nix Helper) Tool | [nix-helper-video](https://github.com/vimjoyer/nix-helper-video) | Installing and configuring nh, setting FLAKE env var, specialisations for switching between nvidia driver versions |
| Flake Starter Template | [nixos-flake](https://github.com/vimjoyer/nixos-flake) | A `nix flake init` template providing a basic NixOS config flake structure |
| Flake Input Update Tool | [nix-update-input](https://github.com/vimjoyer/nix-update-input) | Shell script/package using fzf to interactively select and update a flake input |
| Flake-Parts Wrapper Modules Template | [flake-parts-wrapped-template](https://github.com/vimjoyer/flake-parts-wrapped-template) | A `nix flake init` template for flake-parts with wrapper-modules pattern |

## Home Manager / Modules

| Video | Repo | Description |
|-------|------|-------------|
| Home Manager Custom Modules | [hm-modules-video](https://github.com/vimjoyer/hm-modules-video) | Creating HM modules with mkOption (types.path, types.listOf, types.submodule), a monitors module for Hyprland |
| NixOS Impermanence Setup | [impermanent-setup](https://github.com/vimjoyer/impermanent-setup) | Disko-based disk formatting, impermanence pattern (ephemeral root), installing NixOS with impermanence from scratch |

## Security / Secrets

| Video | Repo | Description |
|-------|------|-------------|
| Secrets Management with sops-nix | [sops-nix-video](https://github.com/vimjoyer/sops-nix-video) | Generating age keys, converting SSH keys to age, sops-nix NixOS module, declaring secrets in .sops.yaml |

## Desktop / Theming

| Video | Repo | Description |
|-------|------|-------------|
| [Supercharge Your Linux Desktop With Vim Key Binds](https://www.youtube.com/watch?v=jhIr9VN2znI) | - | Vim-style keybindings across the Linux desktop environment |
| [Ultimate NixOS Desktop: Niri, Noctalia Shell, and the Dendritic Pattern](https://www.youtube.com/watch?v=aNgujRXDTdE) | [nixconf](https://github.com/vimjoyer/nixconf) | Full NixOS desktop setup using Niri compositor, Noctalia Shell, and the dendritic flake pattern |
| Hyprland with Home Manager | [hyprland-hm-video](https://github.com/vimjoyer/hyprland-hm-video) | Adding Hyprland flake input, setting Hyprland package, startup scripts with writeShellScriptBin, HM Hyprland settings |
| Stylix System-Wide Theming | [stylix-video](https://github.com/vimjoyer/stylix-video) | Installing Stylix (NixOS and standalone HM), base16 color schemes, fonts/cursors configuration |
| Declarative Firefox Configuration | [nix-firefox-video](https://github.com/vimjoyer/nix-firefox-video) | programs.firefox in home-manager, custom search engines, bookmarks, settings, userChrome CSS, extensions |
| LF File Manager in Nix | [lf-nix-video](https://github.com/vimjoyer/lf-nix-video) | programs.lf in home-manager, custom commands, keybindings, image previews with kitty icat |

## Neovim

| Video | Repo | Description |
|-------|------|-------------|
| Neovim Configuration (Lua) | [nvim-video](https://github.com/vimjoyer/nvim-video) | Pure Lua Neovim config (init.lua, lazy.nvim plugin manager) |
| Neovim Managed with Nix/Home-Manager | [nvim-nix-video](https://github.com/vimjoyer/nvim-nix-video) | Managing Neovim via home-manager with plugins fetched as non-flake inputs |
| NixVim Configuration | [nixvim-video](https://github.com/vimjoyer/nixvim-video) | Configuring Neovim entirely in Nix using NixVim -- nvim-cmp, LSP servers, keymaps, extraPlugins |
| Nixd Language Server Setup | [nix-editor-setup-video](https://github.com/vimjoyer/nix-editor-setup-video) | Installing nixd, lspconfig for Neovim, VS Code nix-ide, Emacs lsp-mode, alejandra/nixfmt formatting |
| LuaSnip Snippets in Neovim | [nvim-luasnip-video](https://github.com/vimjoyer/nvim-luasnip-video) | LuaSnip snippet creation (text/insert/choice/function/dynamic nodes, fmt), keybindings for snippet navigation |

## Gaming

| Video | Repo | Description |
|-------|------|-------------|
| NixOS Gaming Setup | [nixos-gaming-video](https://github.com/vimjoyer/nixos-gaming-video) | OpenGL/GPU drivers (NVIDIA/AMD), NVIDIA PRIME sync/offload, Steam, Gamescope, MangoHud, Gamemode, ProtonUp-GE |

## Servers

| Video | Repo | Description |
|-------|------|-------------|
| Declarative Minecraft Servers | [nixos-minecraft-server-video](https://github.com/vimjoyer/nixos-minecraft-server-video) | services.minecraft-server module, server properties, nix-minecraft for Fabric/modded servers |

---

## Key Resources

- **Vimjoyer's NixOS config**: https://github.com/vimjoyer/nixconf (uses dendritic pattern)
- **Nix TOC / examples**: https://www.vimjoyer.com/nix
- **Dendritic pattern**: https://github.com/mightyiam/dendritic
- **Support**: https://ko-fi.com/vimjoyer
