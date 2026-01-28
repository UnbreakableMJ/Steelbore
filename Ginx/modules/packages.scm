(define-module (modules packages)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages code)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages games) ; for dosbox/qemu
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image-viewers)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages rust-apps) ; hosts many steelbore tools
  #:use-module (gnu packages shells)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages video)
  #:use-module (gnu packages virtualization)
  #:use-module (gnu packages web)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages wm)
  #:export (steelbore-core-packages))

(define steelbore-core-packages
  (list
   ;;; 1. Login Managers
   ;; greetd & tuigreet managed via services

   ;;; 2. WM/DE
   ;; niri (check nonguix or channels)
   ;; leftwm (rust-apps?)

   ;;; 3. Terminal & Shell
   nushell
   zellij
   atuin
   starship
   alacritty
   wezterm
   ;; rio (might need unpackaged)
   
   ;;; 4. Text Editing
   helix
   lapce
   emacs-next ; closest to emacs-ng
   ;; zed (unpackaged)
   
   ;;; 5. File Management
   yazi
   broot
   ;; superfile (unpackaged)
   
   ;;; 6. Multimedia
   mpv
   yt-dlp
   ncspot
   viu
   vlc
   ;; loupe (gnome-loupe?)
   shortwave
   mousai
   
   ;;; 7. System Replacements (Modern Unix)
   uutils-coreutils
   procs
   gping
   ;; dog (unpackaged, maybe doggo?)
   tokei
   topgrade
   just
   ripgrep
   bat
   eza
   zoxide
   
   ;;; 8. System Monitoring & Tools
   bottom
   bandwhich
   macchina
   trippy
   ;; mission-center (manual)
   ;; sniffnet (manual)
   rbw
   ;; gold/twarden (manual)

   ;;; 9. Communication
   newsboat
   fractal
   newsflash
   xh
   monolith
   lychee
   wget
   curl

   ;;; 10. Productivity & AI
   ;; aichat (manual)
   ;; appflowy (manual)

   ;;; 11. Security & Networking
   rustscan
   mullvad-vpn-app
   
   ;;; 12. Steelbore Verification
   ;; ironbar (manual)
   ;; rqbit (manual)
   
   ;;; 13. Emulation & Compatibility
   dosbox-staging
   ;; dosbox-x (check availability)
   ;; ruffle (check availability)
   qemu
   ))
