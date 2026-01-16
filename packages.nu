# STEELBORE MASTER MANIFEST
let steelbore_packages = [
    # Shells
    "nu", "brush", "pwsh",
    # Utils
    "eza", "bat", "rg", "fd", "dust", "btm", "zoxide", "zellij",
    # Editors
    "helix", "msedit", "rsvim", "amp", "neovide", "zed", "lapce", "emacs-ng", "antigravity", "code-oss",
    # Security
    "bwrap", "rustscan", "sniffglue", "bandwhich"
]

# Check for missing tools
$steelbore_packages | each { |tool| 
    if (which $tool | is-empty) { 
        print $"(ansi red)MISSING:(ansi reset) ($tool)" 
    } 
}
