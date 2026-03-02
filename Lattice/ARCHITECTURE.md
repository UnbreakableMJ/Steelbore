# Steelbore Lattice — Architecture Diagram

```mermaid
graph TB
    subgraph FLAKE["flake.nix"]
        direction TB
        INPUTS["🔗 Inputs"]
        OUTPUT["nixosConfigurations.lattice"]
    end

    subgraph INPUTS_DETAIL["Flake Inputs"]
        direction LR
        NIXPKGS["nixpkgs<br/>25.11 stable"]
        UNSTABLE["nixpkgs-unstable"]
        COSMIC_FLAKE["nixos-cosmic"]
        LANZA["lanzaboote v0.4.2"]
        HM["home-manager<br/>release-25.11"]
        EMACS["emacs-ng"]
        RIVET["rivetui"]
        GOLD["goldwarden"]
        TWARD["twarden"]
    end

    INPUTS --> INPUTS_DETAIL

    OUTPUT --> HOST
    OUTPUT --> MODULES
    OUTPUT --> COSMIC_MOD["nixos-cosmic module"]
    OUTPUT --> LANZA_MOD["lanzaboote module"]
    OUTPUT --> HM_MOD["home-manager module"]

    subgraph HOST["hosts/lattice/"]
        direction TB
        HOST_DEF["default.nix<br/>━━━━━━━━━━━━━<br/>🔧 Limine boot<br/>🐧 XanMod kernel<br/>🌐 NetworkManager<br/>👤 User: mj<br/>🐚 Shell: nushell"]
        HW["hardware-configuration.nix<br/>━━━━━━━━━━━━━<br/>💽 ext4 + vfat<br/>🔌 Intel KVM<br/>📀 NVMe/USB/AHCI"]
        HOME["home.nix<br/>━━━━━━━━━━━━━<br/>🔑 Git identity<br/>⭐ Starship prompt<br/>🐚 Nushell config<br/>🖥️ Terminal themes<br/>🪟 Niri dotfiles<br/>📊 Ironbar dotfiles"]
        HOST_DEF --> HW
    end

    HM_MOD --> HOME

    subgraph MODULES["modules/"]
        direction TB

        subgraph PACKAGES["packages/"]
            direction TB
            PKG_DEF["default.nix<br/>━━━━━━━━<br/>git, vim<br/>serenity-dev script"]
            CATEGORIES["categories.nix<br/>━━━━━━━━━━━━━━━━━━━<br/>14 sections · ~120 pkgs"]
            FONTS["fonts.nix<br/>━━━━━━━━<br/>Orbitron · JetBrains Mono<br/>Cascadia Code · Nerd Fonts<br/>Future Earth · Share Tech Mono"]
            PKG_DEF --> CATEGORIES
            PKG_DEF --> FONTS
        end

        subgraph GUI["gui/"]
            direction TB
            GUI_DEF["default.nix<br/>━━━━━━━━<br/>GUI selector script<br/>greetd + tuigreet"]
            NIRI["niri.nix<br/>━━━━━━━━<br/>🪟 Niri WM<br/>anyrun · ironbar<br/>config.kdl"]
            COSMIC_NIX["cosmic.nix<br/>━━━━━━━━<br/>🌌 COSMIC DE<br/>30+ cosmic-* pkgs<br/>Portal backend"]
            LEFTWM["leftwm.nix<br/>━━━━━━━━<br/>🧱 LeftWM X11<br/>rlaunch"]
            GUI_DEF --> NIRI
            GUI_DEF --> COSMIC_NIX
            GUI_DEF --> LEFTWM
        end

        subgraph CORE["core/"]
            direction TB
            THEME["theme.nix<br/>━━━━━━━━<br/>🎨 Steelbore Palette<br/>ENV vars · TTY colors"]
            SETTINGS["settings.nix<br/>━━━━━━━━<br/>⚙️ Nushell · Starship<br/>Terminal configs<br/>Ironbar · Git<br/>Flatpak · sudo-rs"]
        end
    end

    subgraph CATEGORIES_DETAIL["Package Categories"]
        direction LR
        C1["1. Boot"]
        C2["2. Desktop"]
        C3["3. Monitoring"]
        C4["4. Pkg Mgmt"]
        C5["5. Files"]
        C6["6. Coreutils"]
        C7["7. Dev/Git"]
        C8["8. Security"]
        C9["9. Network"]
        C10["10. Terminal"]
        C11["11. Comms"]
        C12["12. Editors"]
        C13["13. Media"]
        C14["14. AI"]
    end

    CATEGORIES --> CATEGORIES_DETAIL

    subgraph PALETTE["🎨 Steelbore Palette"]
        direction LR
        P1["#000027<br/>Void Navy"]
        P2["#D98E32<br/>Molten Amber"]
        P3["#4B7EB0<br/>Steel Blue"]
        P4["#50FA7B<br/>Radium Green"]
        P5["#FF5C5C<br/>Red Oxide"]
        P6["#8BE9FD<br/>Liquid Coolant"]
    end

    THEME --> PALETTE

    subgraph LOGIN_FLOW["Login Flow"]
        direction LR
        GREETD_SVC["greetd"] --> TUIGREET["tuigreet"]
        TUIGREET --> SEL{"GUI Selector"}
        SEL -->|1| COSMIC_SESS["COSMIC"]
        SEL -->|2| NIRI_SESS["Niri"]
        SEL -->|3| LEFT_SESS["LeftWM"]
    end

    GUI_DEF --> LOGIN_FLOW

    subgraph SECURITY["🔒 Security Stack"]
        direction LR
        SEC1["Lanzaboote<br/>Secure Boot"]
        SEC2["sudo-rs<br/>Memory-safe"]
        SEC3["Sequoia<br/>OpenPGP"]
        SEC4["Goldwarden<br/>Bitwarden"]
    end

    style FLAKE fill:#000027,stroke:#4B7EB0,color:#D98E32
    style HOST fill:#0a0a3a,stroke:#4B7EB0,color:#D98E32
    style MODULES fill:#0a0a3a,stroke:#4B7EB0,color:#D98E32
    style PACKAGES fill:#111144,stroke:#4B7EB0,color:#D98E32
    style GUI fill:#111144,stroke:#4B7EB0,color:#D98E32
    style CORE fill:#111144,stroke:#4B7EB0,color:#D98E32
    style PALETTE fill:#000027,stroke:#D98E32,color:#D98E32
    style LOGIN_FLOW fill:#0a0a3a,stroke:#50FA7B,color:#D98E32
    style SECURITY fill:#0a0a3a,stroke:#FF5C5C,color:#D98E32
    style CATEGORIES_DETAIL fill:#111144,stroke:#4B7EB0,color:#8BE9FD
    style INPUTS_DETAIL fill:#111144,stroke:#4B7EB0,color:#8BE9FD
```

---

## Data Flow Summary

```
┌─────────────────────────────────────────────────────────────────┐
│                        flake.nix                                │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────────────┐  │
│  │   nixpkgs     │  │  unstable    │  │  External Flakes     │  │
│  │   (25.11)     │  │  (bleeding)  │  │  cosmic · lanzaboote │  │
│  │              │  │              │  │  emacs-ng · rivetui  │  │
│  │   ~100 pkgs  │  │   ~8 pkgs   │  │  goldwarden · twarden│  │
│  └──────┬───────┘  └──────┬───────┘  └──────────┬───────────┘  │
│         │                 │                     │              │
│         └─────────────────┼─────────────────────┘              │
│                           ▼                                    │
│              nixosConfigurations.lattice                        │
└───────────────────────────┬─────────────────────────────────────┘
                            │
              ┌─────────────┼──────────────┐
              ▼             ▼              ▼
     ┌────────────┐  ┌───────────┐  ┌───────────┐
     │   hosts/   │  │ modules/  │  │  home-    │
     │  lattice   │  │           │  │  manager  │
     │            │  │           │  │           │
     │ • Boot     │  │ packages/ │  │ • Git     │
     │ • Kernel   │  │ • 14 cats │  │ • Shell   │
     │ • User     │  │ • fonts   │  │ • Terms   │
     │ • Network  │  │           │  │ • WM dots │
     │ • Hardware │  │ gui/      │  │ • Bar     │
     │            │  │ • COSMIC  │  └───────────┘
     └────────────┘  │ • Niri    │
                     │ • LeftWM  │
                     │ • greetd  │
                     │           │
                     │ core/     │
                     │ • theme   │
                     │ • settings│
                     └───────────┘
```
