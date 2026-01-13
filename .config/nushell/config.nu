# STEELBORE MASTER ALIASES // CACHYOS PORT
# Brand: S3cure.me | License: GPL 3+
# Identity: Charcoal Navy / Vibrant Orange

# --- File Listing (The 'eza' Suite) ---
# Replaces ls with the modern Rust-based eza
alias ls = eza --grid --color=auto --icons --group-directories-first
alias l  = eza --show-dotfiles --icons
alias ll = eza --long --header --git --icons
alias la = eza --all --icons
alias lt = eza --tree --level 2 --icons
alias lS = eza --oneline --sort=size
alias l. = eza --list-dirs .* --icons

# --- Navigation & Utilities ---
alias ..  = cd ..
alias ... = cd ../..
alias .3  = cd ../../..
alias .4  = cd ../../../../..
alias grep = rg               # Ripgrep (Rust)
alias cat  = bat --style="plain" --paging=never
alias diff = delta            # Git-delta (Rust)
alias du   = dust             # Dust (Rust)
alias top  = btm              # Bottom (Rust)
alias find = fd               # FD (Rust)
alias cls  = clear

# --- Safety & Precision ---
# CachyOS default: Interactive confirmation for dangerous tasks
alias cp = cp -i
alias mv = mv -i
alias rm = rm -i
alias mkdir = mkdir -p

# --- Tactical S3cure.me Networking ---
# Quick check for S3cure.me DNS status
alias dns-check = resolvectl status # On Linux
alias s3cure-ping = ping s3cure.me

# --- Package Management Handoff ---
# These detect the host flavor and run the appropriate update command
def update [] {
    let os = (uname | get kernel-name)
    if $os == "Linux" {
        if (which pacman | is-empty) == false {
            sudo pacman -Syu # Velocity / Kinetic
        } else if (which apt | is-empty) == false {
            sudo apt update; sudo apt upgrade -y # Universal
        } else if (which apk | is-empty) == false {
            sudo apk update; sudo apk upgrade # Alpine
        }
    } else if $os == "OpenBSD" {
        sudo pkg_add -u # Open
    } else if $os == "FreeBSD" {
        sudo pkg upgrade # Free
    }
}

# --- CachyOS Maintenance Favorites ---
alias cleanup = (
    if (which pacman | is-empty) == false {
        sudo pacman -Rns (pacman -Qtdq)
    } else {
        print "No orphan cleanup defined for this flavor."
    }
)
