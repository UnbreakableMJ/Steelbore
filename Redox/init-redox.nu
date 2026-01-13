#!/usr/bin/env nu
# STEELBORE REDOX // PURE RUST INITIALIZER
# Identity: S3cure.me | License: GPL 3+

def main [] {
    print $"(ansi orange_bold)>>> ARMING STEELBORE REDOX: THE NATIVE TIER...(ansi reset)"

    # 1. Update Redox System Packages
    # Redox uses 'pkg' for its scheme-based package management
    sudo pkg install nushell helix eza bat ripgrep

    # 2. Configure the HUD (Ion to Nushell Handoff)
    # Redox defaults to the Ion shell; we redirect to the Steelbore HUD
    "exec nu" | save -f file:/home/mj/.ionrc

    # 3. Apply S3cure.me DNS (Redox specific path)
    # Redox uses a unique URL-based filesystem
    "nameserver 1.2.3.4\nnameserver 1.2.3.5" | sudo save -f file:/etc/resolv.conf

    print $"(ansi green)Redox Tier Synchronized.(ansi reset)"
}
