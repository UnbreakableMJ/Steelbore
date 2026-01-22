{ pkgs, unstable, ... }:

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
    unstable.brush
    unstable.ion
    alacritty
    wezterm
    rio
    cosmic-term
    ptyxis

    # 4. Text Editing
    helix
    unstable.msedit
    unstable.antigravity
    zed-editor
    lapce
    neovide
    cosmic-edit
    # emacs-ng (Check if available or use overlay)

    # 5. File Management
    yazi
    broot
    unstable.superfile
    unstable.kondo
    # cosmic-files (Handled by cosmic module?)
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
    # ironbar
    # authenticator

    # 9. Communication
    iamb
    # rumatui
    # disrust
    # RivetUI
    newsboat
    fractal
    # newsflash

    # 10. Productivity & AI
    aichat
    # gemini-cli
    # claude-cli
    unstable.appflowy

    # 11. Security & Networking
    rustscan
    sniffglue
    # rqbit
    mullvad-vpn
    unstable.pika-backup
    # cosmic-store
  ];
}
