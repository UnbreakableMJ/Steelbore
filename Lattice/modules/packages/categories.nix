{ pkgs, unstable, emacs-ng, rivetui, goldwarden, twarden, ... }:

{
  environment.systemPackages = with pkgs; [
    # 1. Login Managers
    greetd.greetd
    greetd.tuigreet
    lemurs
    # cosmic-greeter (managed by module)
    # sudo-rs (managed by security.sudo-rs)

    # 2. Desktop Environments & Window Managers
    # cosmic-de (managed by module)
    # leftwm (managed by module)
    # niri (managed by module) 
    # dankmaterialshell (Missing in standard channels)

    # Launcher
    # onagre (Might need overlay)
    
    # Input
    xremap # May require flake input/module

    # 3. Terminal & Shell Environment
    nushell
    zellij
    atuin
    starship
    brush
    ion
    alacritty
    wezterm
    rio
    # t-rec (Check availability)

    # 4. Text Editing
    helix
    # rsvim (Unpackaged?)
    amp
    msedit
    zed-editor
    lapce
    tau
    neovide
    emacs-ng.packages.${pkgs.system}.default
    code-oss
    
    # 5. File & Disk Management
    yazi
    broot
    unstable.superfile
    unstable.spacedrive
    gptman
    unstable.disktui
    dua
    dust
    fclones
    kondo

    # 6. Multimedia & Processing
    mpv
    yt-dlp
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
    ffmpeg
    rav1e
    gifski
    oxipng
    video-trimmer
    # gydl

    # 7. Core Utilities (The "Modern Unix" Stack)
    fd
    ripgrep
    bat
    eza
    sd
    ouch
    zoxide
    uutils-coreutils
    procs
    tokei
    
    # 8. Package & System Management
    topgrade
    paru
    cargo-update
    # linutil
    flatpak
    guix
    nix
    kmon
    
    # 9. System Monitoring & Panels
    ironbar
    eww
    bottom
    bandwhich
    macchina
    mission-center
    unstable.sniffnet
    sbctl

    # 10. Communication
    # matrix-commander-rs
    iamb
    # rumatui
    # disrust
    rivetui.packages.${pkgs.system}.default
    # lemoncord
    # fastcord
    # ebou
    fractal
    newsflash

    # 11. Security & Encryption
    age
    rage
    sequoia
    rbw
    goldwarden.packages.${pkgs.system}.default
    authenticator
    unstable.pika-backup

    # 12. Networking & Internet
    xh
    monolith
    lychee
    # ssh-rs
    rustscan
    sniffglue
    mullvad-vpn
    trippy
    wget2
    curl
    unstable.rqbit

    # 13. Productivity & AI
    # appflowy
    affine
    aichat
    gemini-cli
    claude-code

    # 14. Emulation & Compatibility
    dosbox-staging
    dosbox-x
    ruffle
    qemu
  ];
}
