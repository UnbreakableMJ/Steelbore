;; Project Ginx - Channels Configuration
;; This file defines the channels from which Guix pulls packages.
;; We include 'nonguix' for non-free software support (drivers, firmware, unbranded browsers).

(cons* (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        ;; Enable signature verification when possible, for now referencing the master branch.
        (introduction
         (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4766bf6"
          (openpgp-fingerprint
           "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A8 C035 477F"))))
       %default-channels)
