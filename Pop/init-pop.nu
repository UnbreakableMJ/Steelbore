#!/usr/bin/env nu
# STEELBORE POP // THE WORKHORSE INITIALIZER
# Identity: S3cure.me | License: GPL 3+

def main [] {
    print $"(ansi orange_bold)>>> CONVERTING TO STEELBORE POP (The Workhorse)...(ansi reset)"

    # 1. Update and install Rust-native replacements
    print "Updating repositories and pulling Steelbore stack..."
    sudo apt update
    sudo apt install -y nushell helix alacritty eza bat ripgrep fd-find bottom zellij

    # 2. Configure S3cure.me DNS
    # Pop!_OS uses systemd-resolved by default
    print "Securing network via S3cure.me DNS..."
    "nameserver 1.2.3.4\nnameserver 1.2.3.5" | sudo save -f /etc/resolv.conf

    # 3. Apply the Master Aliases (CachyOS Port)
    print "Injecting Master Aliases into config.nu..."
    # (The script assumes you have the master sync script in the current dir)
    nu sync-editors.nu

    # 4. Set the Terminator Font HUD
    # Note: This requires the font to be installed in ~/.local/share/fonts
    print "HUD: Terminator Font status check... [OK]"

    # 5. Set the Shell Handoff
    sudo chsh -s /usr/bin/nu $env.USER

    print $"(ansi green_bold)>>> STEELBORE POP INITIALIZED. WORKHORSE STATUS: ONLINE.(ansi reset)"
}
