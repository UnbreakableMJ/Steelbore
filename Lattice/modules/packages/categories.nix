{ pkgs, unstable, emacs-ng, rivetui, goldwarden, twarden, ... }:

{
  environment.systemPackages = [
    # 1. Login Managers
    pkgs.greetd.greetd # [Daemon]
    pkgs.greetd.tuigreet #🦀 [TUI]
    pkgs.lemurs #🦀 [TUI]

    # 2. Desktop Environments & Window Managers
    pkgs.dms-shell #🐹 [GUI]

    # Input
    pkgs.xremap #🦀 [CLI]

    # 3. Terminal & Shell Environment
    pkgs.nushell #🦀 [CLI]
    pkgs.zellij #🦀 [TUI]
    pkgs.atuin #🦀 [CLI]
    pkgs.starship #🦀 [CLI]
    pkgs.brush #🦀 [CLI]
    pkgs.ion #🦀 [CLI]
    pkgs.alacritty #🦀 [GUI]
    pkgs.wezterm #🦀 [GUI]
    pkgs.rio #🦀 [GUI]

    # 4. Text Editing
    pkgs.helix #🦀 [TUI]
    pkgs.amp #🦀 [TUI]
    pkgs.msedit #🦀 [TUI]
    pkgs.zed-editor #🦀 [GUI]
    pkgs.lapce #🦀 [GUI]
    pkgs.tau #🦀 [GUI]
    pkgs.neovide #🦀 [GUI]
    emacs-ng.packages.${pkgs.system}.default #⚠️ [GUI]
    pkgs.code-oss #⚠️ [GUI]
    
    # 5. File & Disk Management
    pkgs.yazi #🦀 [TUI]
    pkgs.broot #🦀 [TUI]
    unstable.superfile #🐹 [TUI]
    unstable.spacedrive #🦀 [GUI]
    pkgs.gptman #🦀 [CLI]
    unstable.disktui #🦀 [TUI]
    pkgs.dua #🦀 [TUI]
    pkgs.dust #🦀 [CLI]
    pkgs.fclones #🦀 [CLI]
    pkgs.kondo #🦀 [CLI]

    # 6. Multimedia & Processing
    pkgs.mpv #⚠️ [CLI/GUI]
    pkgs.yt-dlp #🐍 [CLI]
    pkgs.ncspot #🦀 [TUI]
    pkgs.termusic #🦀 [TUI]
    pkgs.viu #🦀 [CLI]
    pkgs.vlc #⚠️ [GUI]
    pkgs.loupe #🦀 [GUI]
    pkgs.psst #🦀 [GUI]
    pkgs.amberol #🦀 [GUI]
    pkgs.shortwave #🦀 [GUI]
    pkgs.mousai #🦀 [GUI]
    pkgs.gyroflow #🦀 [GUI]
    pkgs.ffmpeg #⚠️ [CLI]
    pkgs.rav1e #🦀 [CLI]
    pkgs.gifski #🦀 [CLI]
    pkgs.oxipng #🦀 [CLI]
    pkgs.video-trimmer #🦀 [GUI]

    # 7. Core Utilities (The "Modern Unix" Stack)
    pkgs.fd #🦀 [CLI]
    pkgs.ripgrep #🦀 [CLI]
    pkgs.bat #🦀 [CLI]
    pkgs.eza #🦀 [CLI]
    pkgs.sd #🦀 [CLI]
    pkgs.ouch #🦀 [CLI]
    pkgs.zoxide #🦀 [CLI]
    pkgs.uutils-coreutils #🦀 [CLI]
    pkgs.procs #🦀 [CLI]
    pkgs.tokei #🦀 [CLI]
    
    # 8. Package & System Management
    pkgs.topgrade #🦀 [CLI]
    pkgs.paru #🦀 [CLI]
    pkgs.cargo-update #🦀 [CLI]
    pkgs.flatpak #⚠️ [CLI]
    pkgs.guix #⚠️ [CLI]
    pkgs.nix #⚠️ [CLI]
    pkgs.kmon #🦀 [TUI]
    
    # 9. System Monitoring & Panels
    pkgs.ironbar #🦀 [GUI]
    pkgs.eww #🦀 [GUI]
    pkgs.bottom #🦀 [TUI]
    pkgs.bandwhich #🦀 [TUI]
    pkgs.macchina #🦀 [CLI]
    pkgs.mission-center #🦀 [GUI]
    unstable.sniffnet #🦀 [GUI]
    pkgs.sbctl #🦀 [CLI]

    # 10. Communication
    pkgs.iamb #🦀 [TUI]
    rivetui.packages.${pkgs.system}.default #🦀 [TUI]
    pkgs.fractal #🦀 [GUI]
    pkgs.newsflash #🦀 [GUI]

    # 11. Security & Encryption
    pkgs.age #🦀 [CLI]
    pkgs.rage #🦀 [CLI]
    pkgs.sequoia #🦀 [CLI]
    pkgs.rbw #🦀 [CLI]
    goldwarden.packages.${pkgs.system}.default #🦀 [GUI]
    pkgs.authenticator #🦀 [GUI]
    unstable.pika-backup #🦀 [GUI]

    # 12. Networking & Internet
    pkgs.xh #🦀 [CLI]
    pkgs.monolith #🦀 [CLI]
    pkgs.lychee #🦀 [CLI]
    pkgs.rustscan #🦀 [CLI]
    pkgs.sniffglue #🦀 [CLI]
    pkgs.mullvad-vpn #🦀 [GUI]
    pkgs.trippy #🦀 [TUI]
    pkgs.wget2 #⚠️ [CLI]
    pkgs.curl #⚠️ [CLI]
    unstable.rqbit #🦀 [GUI]

    # 13. Productivity & AI
    pkgs.affine #🦀 [GUI]
    pkgs.aichat #🦀 [CLI]
    pkgs.gemini-cli #🦀 [CLI]
    pkgs.claude-code #🦀 [CLI]

    # 14. Emulation & Compatibility
    pkgs.dosbox-staging #⚠️ [GUI]
    pkgs.dosbox-x #⚠️ [GUI]
    pkgs.ruffle #🦀 [GUI]
    pkgs.qemu #⚠️ [CLI]
  ];
}
