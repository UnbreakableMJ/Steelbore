(define-module (modules desktop)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services desktop)
  #:use-module (gnu services xorg)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  ;#:use-module (gnu packages wm) ; for niri if packaged
  ;#:use-module (gnu packages admin) ; for greetd
  #:export (steelbore-desktop-services))

;;
;; Niri Service Definition (Placeholder / Custom)
;;
(define niri-service-type
  (service-type
   (name 'niri)
   (description "Run Niri compositor.")
   (extensions
    (list (service-extension profile-service-type
                             (const (list))))) ;; Add niri package here
   (default-value #f)))

;;
;; Greetd Service
;;
(define greetd-config
  (greetd-configuration
   (terminals
    (list (greetd-terminal-configuration
           (terminal-vt "1")
           (terminal-switch #t)
           (default-session-command
             (greetd-agreety-session
              (command (file-append
                        (specification->package "tuigreet")
                        "/bin/tuigreet --time --cmd nu")))))))))

(define steelbore-desktop-services
  (list
   ;; Use standard desktop services except for GDM/GNOME default
   (service greetd-service-type greetd-config)
   ;; (service niri-service-type) ; Uncomment when niri package is ready
   ))
