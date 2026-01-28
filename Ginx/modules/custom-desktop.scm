(define-module (modules custom-desktop)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:use-module (guix licenses)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xorg)
  #:export (niri ironbar))

(define-public niri
  (package
    (name "niri")
    (version "0.1.10") ; Update to latest
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/YaLTeR/niri")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               ;; Placeholder: run `guix hash -rx .` on the source or let build fail
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (;; Dependencies inferred from Cargo.toml
        ;; Note: In a real scenario, this requires mapping ALL cargo deps
        ;; For now, allowing cargo-build-system to fetch vendored deps if possible
        ;; or demanding a generated dependency list.
        )
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-paths
           (lambda _
             ;; Patching hardcoded paths if necessary
             #t)))))
    (native-inputs
     (list pkg-config python))
    (inputs
     (list libxkbcommon mesa pango cairo glib egl-wayland libinput udev))
    (home-page "https://github.com/YaLTeR/niri")
    (synopsis "Scrollable-tiling Wayland compositor")
    (description "A scrollable-tiling Wayland compositor focused on horizontal scrolling.")
    (license gpl3)))

(define-public ironbar
  (package
    (name "ironbar")
    (version "0.15.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/JakeStanger/ironbar")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32 "0000000000000000000000000000000000000000000000000000"))))
    (build-system cargo-build-system)
    (native-inputs (list pkg-config))
    (inputs (list gtk+ gtk-layer-shell))
    (home-page "https://github.com/JakeStanger/ironbar")
    (synopsis "Customizable GTK bar for wlroots/niri")
    (description "A customizable and battery-efficient system bar for Wayland.")
    (license mit)))
