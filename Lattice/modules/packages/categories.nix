{ pkgs, unstable, emacs-ng, rivetui, goldwarden, twarden, ... }:

{
  environment.systemPackages = with pkgs; [
    # 1. Login Managers
    greetd.tuigreet
    lemurs

    # 2. Desktop Environments & Window Managers
    niri
    leftwm
    # cosmic-de is handled by the nixos-cosmic module

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
    warp-terminal
    ptyxis
    cosmic-term

    # 4. Text Editing
    helix
    unstable.msedit
    unstable.antigravity
    zed-editor
    lapce
    neovide
    cosmic-edit
    tau
    amp-cli
    emacs-ng.packages.${pkgs.system}.default
    code-oss

    # 5. File Management
    yazi
    broot
    unstable.superfile
    unstable.kondo
    unstable.spacedrive
    cosmic-files
    gptman

    # 6. Multimedia
    mpv
    yt-dlp
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
    cargo-update

    # 8. System Monitoring & Tools
    bottom
    bandwhich
    macchina
    trippy
    unstable.mission-center
    unstable.sniffnet
    eww
    rbw
    goldwarden.packages.${pkgs.system}.default
    twarden.packages.${pkgs.system}.default
    sbctl # Secure Boot / Lanzaboote tool

    # 9. Communication & Internet
    iamb
    newsboat
    fractal
    newsflash
    xh
    monolith
    lychee
    wget2
    wget
    curl

    # 10. Productivity & AI
    aichat
    unstable.appflowy
    affine

    # 11. Security & Networking
    rustscan
    sniffglue
    mullvad-vpn
    unstable.pika-backup

    # 12. Steelbore Verification & Custom
    ironbar
    rqbit
    gemini-cli
    claude-code
    rivetui.packages.${pkgs.system}.default

    # 13. Emulation & Compatibility
    dosbox-staging
    dosbox-x
    ruffle
    qemu
  ];
}
