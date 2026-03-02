# Steelbore Lattice — NixOS Configuration Reference

> **Version:** NixOS 25.11 (Stable) + Unstable overlay
> **Host:** `lattice` · `x86_64-linux` · Intel · XanMod Kernel
> **User:** `mj` · Shell: Nushell · Editor: Helix

---

## Flake Inputs

| Input | Source | Purpose |
|-------|--------|---------|
| `nixpkgs` | `nixos-25.11` | Stable package set |
| `nixpkgs-unstable` | `nixos-unstable` | Bleeding-edge packages (Sniffnet, Spacedrive, Superfile, etc.) |
| `nixos-cosmic` | `lilyinstarlight/nixos-cosmic` | COSMIC DE modules (follows `nixpkgs`) |
| `emacs-ng` | `emacs-ng/emacs-ng` | Rust-enhanced Emacs |
| `rivetui` | `rivet-gg/rivetui` | Discord TUI client |
| `goldwarden` | `quexten/goldwarden` | Bitwarden desktop client |
| `twarden` | `p-m-p/twarden` | Bitwarden TUI |
| `lanzaboote` | `nix-community/lanzaboote` v0.4.2 | UEFI Secure Boot (follows `nixpkgs`) |
| `home-manager` | `nix-community/home-manager` release-25.11 | Per-user config (follows `nixpkgs`) |

Binary cache: `cosmic.cachix.org`

---

## File Map

```
Lattice/
├── flake.nix                          # Inputs, outputs, nixosConfigurations.lattice
├── flake.lock                         # Pinned dependency hashes
├── hosts/
│   └── lattice/
│       ├── default.nix                # Host: boot, networking, user, locale
│       ├── hardware-configuration.nix # Disk layout, kernel modules, CPU
│       └── home.nix                   # Home Manager: git, shells, terminals, WM dotfiles
└── modules/
    ├── packages/
    │   ├── default.nix                # Entry point → imports categories + fonts
    │   ├── categories.nix             # 14-section package manifest (~120 packages)
    │   └── fonts.nix                  # Typography: Orbitron, JetBrains Mono, Cascadia Code, etc.
    ├── gui/
    │   ├── default.nix                # GUI selector script + greetd/tuigreet config
    │   ├── cosmic.nix                 # COSMIC DE enable + 30 cosmic-* packages
    │   ├── niri.nix                   # Niri WM enable + config.kdl + anyrun/ironbar
    │   └── leftwm.nix                 # LeftWM X11 enable + rlaunch
    └── core/
        ├── theme.nix                  # Steelbore color palette → env vars + TTY colors
        └── settings.nix               # Nushell, Starship, terminal configs, Ironbar, Git, Flatpak, sudo-rs
```

---

## Host: `lattice`

| Setting | Value |
|---------|-------|
| Bootloader | Limine + Lanzaboote (Secure Boot) |
| Kernel | `linuxPackages_xanmod` |
| Hostname | `lattice` |
| Timezone | UTC |
| Locale | `en_US.UTF-8` |
| Keyboard | `us,ar` (toggle: Ctrl+Space) |
| Filesystem | ext4 (`/`) + vfat (`/boot`) |
| Networking | NetworkManager + DHCP |
| Unfree | Allowed |
| State Version | 25.11 |

### User `mj`

| Setting | Value |
|---------|-------|
| Groups | `networkmanager`, `wheel`, `video`, `audio` |
| Shell | Nushell |
| Editor | Helix (`hx`) |
| Git Identity | `UnbreakableMJ` / `34196588+UnbreakableMJ@users.noreply.github.com` |
| GPG Format | SSH |

---

## Steelbore Color Palette

> *"Color is not decoration; it is telemetry."*

| Token | Hex | Role |
|-------|-----|------|
| Void Navy | `#000027` | Background / Canvas |
| Molten Amber | `#D98E32` | Primary Text / Active Readout |
| Steel Blue | `#4B7EB0` | Primary Accent / Structural |
| Radium Green | `#50FA7B` | Success / Safe Status |
| Red Oxide | `#FF5C5C` | Warning / Error Status |
| Liquid Coolant | `#8BE9FD` | Info / Links |

Applied to: TTY console, Alacritty, WezTerm, Rio, Ironbar, Niri focus-ring, Starship prompt.

---

## Desktop Environments

### 1. Niri (Wayland) — *The Steelbore Standard*

- Scrollable tiling compositor
- Focus ring: 2px Molten Amber (active) / Steel Blue (inactive)
- 8px gaps, no borders
- Spawns: `swaybg` (Void Navy), `ironbar`
- Launcher: `onagre` (Mod+D) · Terminal: `alacritty` (Mod+Return)

### 2. COSMIC DE (Wayland)

- Full desktop via `nixos-cosmic` module
- 30+ `cosmic-*` packages (session, term, edit, files, store, panel, etc.)
- Greeter service toggleable (`cosmic-greeter.enable = false` by default)

### 3. LeftWM (X11)

- Tiling WM with `rlaunch` launcher
- Fallback X11 session

### Login Flow

greetd → tuigreet → GUI selector script → Niri | COSMIC | LeftWM

---

## Package Manifest (14 Sections)

### 1. Boot & Login
`sbctl` · `greetd` · `tuigreet` · `lemurs`

### 2. Desktop & Window Management
`dms-shell` · `onagre` · `xremap`
*(niri, leftwm, COSMIC, anyrun, rlaunch → dedicated GUI modules)*

### 3. System Monitoring & Panels
`ironbar` · `eww` · `wired` · `kmon` · `bottom` · `bandwhich` · `mission-center` · `macchina`

### 4. Package & System Management
`topgrade` · `paru` · `cargo-update` · `dotter` · `guix` · `flatpak` · `nix`

### 5. File & Disk Management
`yazi` · `broot` · `superfile`° · `spacedrive`° · `dust` · `dua` · `fclones` · `kondo` · `disktui`° · `gptman`

### 6. Core Utilities ("Modern Unix")
`fd` · `ripgrep` · `bat` · `eza` · `sd` · `ouch` · `zoxide` · `jaq` · `uutils-coreutils` · `procs` · `tokei`

### 7. Development & Git
`gitui` · `delta` · `jujutsu` · `rustup` · `lorri` · `just`

### 8. Security & Encryption
`age` · `rage` · `sequoia` · `sequoia-chameleon-gnupg` · `rbw` · `goldwarden`ᶠ · `authenticator` · `pika-backup`°

### 9. Networking & Internet
`impala` · `iwd` · `nmstate` · `xh` · `monolith` · `lychee` · `gping` · `rustscan` · `sniffglue` · `trippy` · `wget2` · `curl` · `sniffnet`° · `mullvad-vpn` · `rqbit`°

### 10. Terminal Environment
`ghostty` · `alacritty` · `wezterm` · `rio` · `nushell` · `brush` · `starship` · `atuin` · `ion` · `zellij` · `t-rec`

### 11. Communication
`iamb` · `rivetui`ᶠ · `fractal` · `newsflash`

### 12. Text Editing
`helix` · `amp` · `msedit` · `zed-editor` · `lapce` · `tau` · `neovide` · `emacs-ng`ᶠ · `vscodium` · `code-oss`

### 13. Multimedia & Processing
`mpv` · `amberol` · `shortwave` · `ncspot` · `psst` · `termusic` · `loupe` · `viu` · `mousai` · `ffmpeg` · `rav1e` · `gifski` · `oxipng` · `gyroflow` · `video-trimmer` · `yt-dlp`

### 14. AI & Productivity
`opencode` · `aichat` · `gemini-cli` · `claude-code` · `appflowy` · `affine`

> ° = from `nixpkgs-unstable` · ᶠ = from flake input

### Fonts
`Orbitron` (UI) · `JetBrains Mono` + Nerd Fonts (Code) · `Cascadia Code` (Terminal) · `Future Earth` (Brand) · `Share Tech Mono` (HUD)

---

## Services & Security

| Service | Config |
|---------|--------|
| `greetd` | Enabled, tuigreet default session |
| `flatpak` | Enabled |
| `COSMIC DM` | Enabled (greeter off) |
| `niri` | `programs.niri.enable = true` |
| `leftwm` | `services.xserver.windowManager.leftwm.enable = true` |
| `polkit` | Enabled |
| `sudo-rs` | Enabled, wheel-only · **standard sudo disabled** |
| `lanzaboote` | Secure Boot module loaded |

---

## Home Manager (`home.nix`)

Manages per-user dotfiles via `xdg.configFile`:

| App | Config Type | Key Settings |
|-----|------------|--------------|
| Git | `programs.git` | Identity, SSH signing, main branch |
| Starship | `programs.starship` | Steelbore palette, directory/git/character format |
| Nushell | `programs.nushell` | Aliases (telemetry, sensors, edit), `steelbore` command |
| Alacritty | `programs.alacritty` | Steelbore colors, Cascadia Code 12pt, 95% opacity |
| Niri | `xdg.configFile` | Focus ring, gaps, binds, spawns |
| Ironbar | `xdg.configFile` | YAML config + CSS (Share Tech Mono, Steelbore colors) |
| WezTerm | `xdg.configFile` | Steelbore colors, Cascadia Code, 95% opacity |
| Rio | `xdg.configFile` | Steelbore colors, Cascadia Code 18pt |

---

## Quick Commands

```bash
# Rebuild system
sudo nixos-rebuild switch --flake .#lattice

# Update all flake inputs
nix flake update

# Check configuration validity
nix flake check

# Update all system packages (via topgrade)
topgrade

# System fetch
macchina
```
