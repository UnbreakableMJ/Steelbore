{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # 1. Login Managers (Packages only, services in gui/default.nix)
    greetd.tuigreet

    # 2. Desktop Environments & Window Managers
    leftwm
    niri
    # cosmic-de is handled by the module in flake.nix

    # Launcher
    onagre
    anyrun
    rlaunch

    # 3. Terminal & Shell Environment
    nushell
    zellij
    atuin
    starship
    brush
    # ion-shell (Often packaged as ion)
    alacritty
    wezterm
    rio
    cosmic-term
    ptyxis

    # 4. Text Editing
    helix
    msedit
    antigravity
    zed-editor
    lapce
    neovide
    cosmic-edit
    # emacs-ng (Check if available or use overlay)

    # 5. File Management
    yazi
    broot
    superfile
    kondo
    cosmic-files
    spacedrive

    # 6. Multimedia
    mpv
    ncspot
    termusic
    viu
    vlc
    loupe
    psst
    amberol
    shortwave
    mousai
    gyroflow

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
    mission-center
    sniffnet
    eww
    ironbar
    authenticator

    # 9. Communication
    iamb
    rumatui
    # disrust
    # RivetUI
    newsboat
    fractal
    newsflash

    # 10. Productivity & AI
    aichat
    # gemini-cli
    # claude-cli
    appflowy

    # 11. Security & Networking
    rustscan
    sniffglue
    rqbit
    mullvad-vpn
    pika-backup
    cosmic-store
  ];
}
