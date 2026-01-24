{ pkgs, unstable, emacs-ng, rivetui, goldwarden, twarden, ... }:

{
  environment.systemPackages = with pkgs; [
    # 1. Login Managers (Packages only, services in gui/default.nix)
    greetd.tuigreet

    # 2. Desktop Environments & Window Managers
    # cosmic-de is handled by the module in flake.nix
    # leftwm and niri moved to gui/ modules

    # Launcher
    onagre
    anyrun
    rlaunch

    # 3. Terminal & Shell Environment
    nushell
    zellij
    atuin
    starship
    unstable.brush
    unstable.ion
    alacritty
    wezterm
    rio
    #cosmic-term
    ptyxis

    # 4. Text Editing
    helix
    unstable.msedit
    unstable.antigravity
    zed-editor
    lapce
    neovide
    cosmic-edit
    emacs-ng.packages.${pkgs.system}.default

    # 5. File Management
    yazi
    broot
    unstable.superfile
    unstable.kondo
    unstable.spacedrive

    # 6. Multimedia
    mpv
    ncspot
    unstable.termusic
    viu
    vlc
    loupe
    psst
    unstable.amberol
    unstable.shortwave
    unstable.mousai
    unstable.gyroflow

    # 7. System Replacements (Modern Unix)
    uutils-coreutils
    procs
    gping
    dog
    tokei
    topgrade
    just
    ripgrep
    bat
    eza
    zoxide
    paru

    # 8. System Monitoring & Panels
    bottom
    bandwhich
    macchina
    trippy
    unstable.mission-center
    unstable.sniffnet
    eww
    # authenticator

    # 9. Communication
    iamb
    # rumatui
    # disrust
    # RivetUI
    newsboat
    fractal

    # 10. Productivity & AI
    aichat
    unstable.appflowy

    # 11. Security & Networking
    rustscan
    sniffglue
    mullvad-vpn
    unstable.pika-backup

    # 12. Bitwarden Setup
    rbw
    goldwarden.packages.${pkgs.system}.default
    twarden.packages.${pkgs.system}.default

    # 12. User Requested Packages (Verified 25.11)
    ironbar
    rqbit
    gemini-cli
    claude-code
    newsflash
    rivetui.packages.${pkgs.system}.default
  ];
}
