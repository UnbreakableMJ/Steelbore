(define-module (modules theme)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system font)
  #:use-module (gnu packages fonts)
  #:use-module (guix licenses)
  #:export (steelbore-palette
            font-future-earth
            font-share-tech-mono
            steelbore-fonts))

;;;
;;; Steelbore Color Palette
;;; "Color is not decoration; it is telemetry."
;;;
(define steelbore-palette
  '((void-navy    . "#000027")  ; Background / Canvas
    (molten-amber . "#D98E32")  ; Primary Text / Active Readout
    (steel-blue   . "#4B7EB0")  ; Primary Accent / Structural
    (radium-green . "#50FA7B")  ; Success / Safe Status
    (red-oxide    . "#FF5C5C")  ; Warning / Error Status
    (liquid-cool  . "#8BE9FD"))) ; Info / Links

;;;
;;; Custom Fonts
;;;

;; Future Earth (Brand / Hero)
(define-public font-future-earth
  (package
    (name "font-future-earth")
    (version "1.0")
    (source (origin
              (method url-fetch/zipbomb)
              (uri "https://font.download/dl/font/future-earth.zip")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000")))) ; Placeholder hash, needs update
    (build-system font-build-system)
    (home-page "https://font.download/font/future-earth")
    (synopsis "Future Earth Font")
    (description "Futuristic font for Steelbore branding.")
    (license (non-copyleft "file://License.txt")))) ;; Verify license in zip

;; Share Tech Mono (HUD / Data) - Often available as font-google-share-tech-mono, but defining here if needed
(define-public font-share-tech-mono
  (package
    (name "font-share-tech-mono")
    (version "1.0")
    (source (origin
              (method url-fetch)
              (uri "https://github.com/google/fonts/raw/main/ofl/sharetechmono/ShareTechMono-Regular.ttf")
              (sha256
               (base32
                "0000000000000000000000000000000000000000000000000000")))) ; Placeholder hash
    (build-system font-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'install
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (font-dir (string-append out "/share/fonts/truetype")))
               (mkdir-p font-dir)
               (copy-file "ShareTechMono-Regular.ttf" 
                          (string-append font-dir "/ShareTechMono-Regular.ttf"))
               #t))))))
    (home-page "https://fonts.google.com/specimen/Share+Tech+Mono")
    (synopsis "Share Tech Mono Font")
    (description "Monospaced font for high-tech HUD displays.")
    (license silofl1.1)))

;;;
;;; Font List
;;;
(define steelbore-fonts
  (list font-orbitron          ; From standard packages
        font-jetbrains-mono    ; From standard packages
        font-cascadia-code     ; From standard packages
        font-future-earth      ; Custom
        font-share-tech-mono)) ; Custom or Standard
