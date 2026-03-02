{ pkgs, unstable, emacs-ng, rivetui, goldwarden, twarden, ... }:

{
  environment.systemPackages = [
    # ══════════════════════════════════════════════════════════════════
    # 1. Boot & Login
    # ══════════════════════════════════════════════════════════════════
    # Bootloader: Lanzaboote → imported as flake module in flake.nix
    pkgs.sbctl                         #🦀 [CLI] Secure Boot Manager

    # Login Managers
    pkgs.greetd.greetd                 #🦀 [Daemon]
    pkgs.greetd.tuigreet               #🦀 [TUI] Best for Niri/LeftWM
    pkgs.lemurs                        #🦀 [TUI]
    # cosmic-greeter                   # → cosmic.nix (service toggle)

    # System Components
    # xdg-desktop-portal-cosmic        # → cosmic.nix
    # sudo-rs                          # → settings.nix (security.sudo-rs)

    # ══════════════════════════════════════════════════════════════════
    # 2. Desktop & Window Management
    # ══════════════════════════════════════════════════════════════════
    # Window Managers & Sessions
    # niri                             # → niri.nix
    # leftwm                           # → leftwm.nix
    # COSMIC DE                        # → cosmic.nix
    # cosmic-session                   # → cosmic.nix

    # Desktop Suites
    pkgs.dms-shell                     #🐹 [GUI] DankMaterialShell (Go/Qt)

    # Launchers
    # anyrun                           # → niri.nix
    # rlaunch                          # → leftwm.nix
    pkgs.onagre                        #🦀 [GUI]

    # Input Tools
    pkgs.xremap                        #🦀 [CLI] Dynamic key remapper

    # ══════════════════════════════════════════════════════════════════
    # 3. System Monitoring & Panels
    # ══════════════════════════════════════════════════════════════════
    # Bars & Widgets
    pkgs.ironbar                       #🦀 [GUI] The "Steelbore" Bar
    pkgs.eww                           #🦀 [GUI] Custom Widgets

    # Notifications
    pkgs.wired                         #🦀 [Daemon] Notification daemon

    # Hardware & Kernel
    pkgs.kmon                          #🦀 [TUI] Kernel manager
    pkgs.bottom                        #🦀 [TUI] Process monitor
    pkgs.bandwhich                     #🦀 [TUI] Bandwidth usage
    pkgs.mission-center                #🦀 [GUI] Task Manager
    pkgs.macchina                      #🦀 [CLI] System fetch

    # ══════════════════════════════════════════════════════════════════
    # 4. Package & System Management
    # ══════════════════════════════════════════════════════════════════
    # The Rust Stack
    # pkgs.omni                        # NOT IN NIXPKGS — Universal Package Manager
    # pkgs.zap                         # NOT IN NIXPKGS — AppImage/System Tool
    pkgs.topgrade                      #🦀 [CLI] Updates everything at once
    pkgs.paru                          #🦀 [CLI] Fast AUR Helper
    pkgs.cargo-update                  #🦀 [CLI] Updates Cargo binaries
    # pkgs.linutil                     # NOT IN NIXPKGS — Distro maintenance tool

    # Dotfile Management
    pkgs.dotter                        #🦀 [CLI] Dotfile manager and templater

    # The Standard Stack
    pkgs.guix                          #(λ) [CLI] Guile Scheme
    # pkgs.am                          # NOT IN NIXPKGS — AppImage Manager (Bash)
    # pkgs.brew                        # NOT IN NIXPKGS — Homebrew (not a NixOS package)
    pkgs.flatpak                       #⚠️  [CLI] (C)
    pkgs.nix                           #⚠️  [CLI] (C++)

    # ══════════════════════════════════════════════════════════════════
    # 5. File & Disk Management
    # ══════════════════════════════════════════════════════════════════
    # File Managers
    pkgs.yazi                          #🦀 [TUI]
    pkgs.broot                         #🦀 [TUI]
    unstable.superfile                 #🐹 [TUI] (Go)
    # cosmic-files                     # → cosmic.nix
    unstable.spacedrive                #🦀 [GUI]

    # Disk Usage & Cleaning
    pkgs.dust                          #🦀 [CLI] Disk usage analyzer
    pkgs.dua                           #🦀 [TUI] Interactive disk usage
    pkgs.fclones                       #🦀 [CLI] Duplicate finder
    pkgs.kondo                         #🦀 [CLI] Project cleaner

    # Partitioning
    unstable.disktui                   #🦀 [TUI] Interactive Partition Manager
    pkgs.gptman                        #🦀 [CLI] Scriptable GPT Manager

    # ══════════════════════════════════════════════════════════════════
    # 6. Core Utilities (The "Modern Unix" Stack)
    # ══════════════════════════════════════════════════════════════════
    # File Operations
    pkgs.fd                            #🦀 [CLI] User-friendly find
    pkgs.ripgrep                       #🦀 [CLI] Fast grep
    pkgs.bat                           #🦀 [CLI] cat with syntax highlighting
    pkgs.eza                           #🦀 [CLI] Modern ls
    pkgs.sd                            #🦀 [CLI] Intuitive sed
    pkgs.ouch                          #🦀 [CLI] Painless compression
    pkgs.zoxide                        #🦀 [CLI] Smarter cd

    # Text Processing
    pkgs.jaq                           #🦀 [CLI] JSON processor (jq clone)
    pkgs.uutils-coreutils              #🦀 [CLI] Coreutils reimplementation
    pkgs.procs                         #🦀 [CLI] Modern ps
    pkgs.tokei                         #🦀 [CLI] Code statistics tool

    # ══════════════════════════════════════════════════════════════════
    # 7. Development & Git
    # ══════════════════════════════════════════════════════════════════
    # Git & Ops
    pkgs.gitui                         #🦀 [TUI] Blazing fast Git UI
    pkgs.delta                         #🦀 [CLI] Syntax-highlighting pager
    pkgs.jujutsu                       #🦀 [CLI] Git-compatible DVCS (jj)
    # pkgs.cpx                         # NOT IN NIXPKGS — Competitive Programming Helper

    # Toolchains & Env
    pkgs.rustup                        #🦀 [CLI] Rust toolchain
    pkgs.lorri                         #🦀 [CLI] Nix environment manager daemon
    pkgs.just                          #🦀 [CLI] Command runner

    # ══════════════════════════════════════════════════════════════════
    # 8. Security & Encryption
    # ══════════════════════════════════════════════════════════════════
    # Tools
    pkgs.age                           #🦀 [CLI] Modern encryption (age)
    pkgs.rage                          #🦀 [CLI] Modern encryption (rage)
    pkgs.sequoia                       #🦀 [CLI] OpenPGP implementation
    pkgs.sequoia-chameleon-gnupg       #🦀 [CLI] GnuPG drop-in replacement
    pkgs.rbw                           #🦀 [CLI] Bitwarden Client
    goldwarden.packages.${pkgs.system}.default #🦀 [GUI] Goldwarden (Bitwarden Desktop)
    pkgs.authenticator                 #🦀 [GUI] 2FA/OTP Client

    # Backup & App Stores
    unstable.pika-backup               #🦀 [GUI] Borg Frontend
    # cosmic-store                     # → cosmic.nix

    # ══════════════════════════════════════════════════════════════════
    # 9. Networking & Internet
    # ══════════════════════════════════════════════════════════════════
    # Network Management
    pkgs.impala                        #🦀 [TUI] TUI for iwd
    pkgs.iwd                           #⚠️  [CLI] Modern Wi-Fi daemon (C)
    pkgs.nmstate                       #🦀 [CLI] Declarative network config

    # Diagnostics & Tools
    pkgs.xh                            #🦀 [CLI] curl replacement
    pkgs.monolith                      #🦀 [CLI] wget archiver
    pkgs.lychee                        #🦀 [CLI] Link checker
    # pkgs.ssh-rs                      # NOT IN NIXPKGS — Rust SSH2
    # pkgs.dog                         # NOT IN NIXPKGS — DNS client (dig replacement)
    pkgs.gping                         #🦀 [CLI] Graphical ping
    pkgs.rustscan                      #🦀 [CLI]
    pkgs.sniffglue                     #🦀 [CLI]
    pkgs.trippy                        #🦀 [TUI]

    # Standard Stack
    pkgs.wget2                         #⚠️  [CLI] (C)
    pkgs.curl                          #⚠️  [CLI] (C)

    # GUI Apps
    unstable.sniffnet                  #🦀 [GUI]
    pkgs.mullvad-vpn                   #🦀 [GUI]
    unstable.rqbit                     #🦀 [GUI] BitTorrent

    # ══════════════════════════════════════════════════════════════════
    # 10. Terminal Environment
    # ══════════════════════════════════════════════════════════════════
    # Emulators
    pkgs.ghostty                       #⚡  [GUI] Zig — High-performance, native
    pkgs.alacritty                     #🦀 [GUI]
    pkgs.wezterm                       #🦀 [GUI]
    pkgs.rio                           #🦀 [GUI]
    # cosmic-term                      # → cosmic.nix

    # Shells
    pkgs.nushell                       #🦀 [CLI]
    pkgs.brush                         #🦀 [CLI] Bash-Compatible
    pkgs.starship                      #🦀 [CLI]
    pkgs.atuin                         #🦀 [CLI]
    pkgs.ion                           #🦀 [CLI]

    # Tools
    pkgs.zellij                        #🦀 [TUI] Multiplexer
    pkgs.t-rec                         #🦀 [CLI] Terminal recorder

    # ══════════════════════════════════════════════════════════════════
    # 11. Communication
    # ══════════════════════════════════════════════════════════════════
    # Matrix
    # pkgs.matrix-commander-rs         # NOT IN NIXPKGS
    pkgs.iamb                          #🦀 [TUI]
    # pkgs.rumatui                     # NOT IN NIXPKGS
    pkgs.fractal                       #🦀 [GUI]

    # Discord
    # pkgs.disrust                     # NOT IN NIXPKGS
    rivetui.packages.${pkgs.system}.default #🦀 [TUI] RivetUI
    # pkgs.lemoncord                   # NOT IN NIXPKGS
    # pkgs.fastcord                    # NOT IN NIXPKGS

    # Fediverse / Social
    # pkgs.ebou                        # NOT IN NIXPKGS — Mastodon
    pkgs.newsflash                     #🦀 [GUI] RSS

    # ══════════════════════════════════════════════════════════════════
    # 12. Text Editing
    # ══════════════════════════════════════════════════════════════════
    # CLI/TUI
    pkgs.helix                         #🦀 [TUI]
    # pkgs.rsvim                       # NOT IN NIXPKGS
    pkgs.amp                           #🦀 [TUI]
    pkgs.msedit                        #🦀 [TUI]

    # GUI
    pkgs.zed-editor                    #🦀 [GUI]
    pkgs.lapce                         #🦀 [GUI]
    pkgs.tau                           #🦀 [GUI]
    # cosmic-edit                      # → cosmic.nix
    pkgs.neovide                       #🦀 [GUI] Neovim Frontend
    emacs-ng.packages.${pkgs.system}.default #⚠️ [GUI] (C/Lisp/Rust)
    pkgs.vscodium                      #⚠️  [GUI] Telemetry-free VS Code
    pkgs.code-oss                      #⚠️  [GUI] (TS)

    # ══════════════════════════════════════════════════════════════════
    # 13. Multimedia & Processing
    # ══════════════════════════════════════════════════════════════════
    # Video/Audio Players
    pkgs.mpv                           #⚠️  [TUI] (C)
    pkgs.amberol                       #🦀 [GUI] Local Music
    pkgs.shortwave                     #🦀 [GUI] Radio
    pkgs.ncspot                        #🦀 [TUI] Spotify
    pkgs.psst                          #🦀 [GUI] Spotify
    pkgs.termusic                      #🦀 [TUI] Local Music
    # pkgs.radio-browser-rust          # NOT IN NIXPKGS
    pkgs.loupe                         #🦀 [GUI] Image Viewer
    pkgs.viu                           #🦀 [CLI] CLI Image Viewer
    pkgs.mousai                        #🦀 [GUI] Song ID

    # Processing & Encoders
    pkgs.ffmpeg                        #⚠️  [CLI] (C)
    pkgs.rav1e                         #🦀 [CLI] AV1 Encoder
    pkgs.gifski                        #🦀 [CLI] GIF Encoder
    pkgs.oxipng                        #🦀 [CLI] PNG Optimizer
    pkgs.gyroflow                      #🦀 [GUI] Stabilization
    pkgs.video-trimmer                 #🦀 [GUI]

    # Downloaders
    pkgs.yt-dlp                        #🐍 [CLI]
    # pkgs.gydl                        # NOT IN NIXPKGS

    # ══════════════════════════════════════════════════════════════════
    # 14. AI & Productivity
    # ══════════════════════════════════════════════════════════════════
    # AI Coding Agents
    pkgs.opencode                      #🐹 [CLI] Go — Open source coding agent
    # pkgs.kilo                        # NOT IN NIXPKGS — TypeScript agentic platform

    # CLI AI Assistants
    pkgs.aichat                        #🦀 [CLI] Universal Chat REPL
    pkgs.gemini-cli                    #🦀 [CLI]
    pkgs.claude-code                   #🦀 [CLI]

    # Knowledge & Workflow
    pkgs.appflowy                      #🦀 [GUI] Open Source Notion
    pkgs.affine                        #🦀 [GUI] Knowledge Base & Whiteboard
  ];
}
