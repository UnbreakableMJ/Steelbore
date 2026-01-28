;; Project Ginx - Main System Configuration
;;
;; "Steelbore Ginx" - GNU Guix Edition
;;

(use-modules (gnu)
             (gnu system)
             (gnu system nss)  ; Name Service Switch
             (guix packages)
             (nongnu packages linux) ; For linux-nonfree
             (nongnu system linux-initrd) ; For microcode
             (modules theme)
             (modules packages))

(use-service-modules desktop networking ssh xorg)
(use-package-modules bootloaders certs fonts shells vim curl wget version-control)

(operating-system
  (host-name "ginx")
  (timezone "UTC")
  (locale "en_US.utf8")

  ;; Kernel: Project XanMod (High Performance Desktop)
  (kernel linux-xanmod) 
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  ;; Bootloader
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout (keyboard-layout "us"))))

  ;; Filesystems (Generic placeholder - needs actual hardware map)
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (file-system-label "GINX_ROOT"))
                         (type "ext4"))
                       (file-system
                         (mount-point "/boot/efi")
                         (device (file-system-label "GINX_EFI"))
                         (type "vfat"))
                       %base-file-systems))

  ;; Users
  (users (cons (user-account
                (name "mj")
                (comment "Steelbore User")
                (group "users")
                (home-directory "/home/mj")
                (supplementary-groups '("wheel" "netdev" "audio" "video" "kvm")))
               %base-user-accounts))

  ;; Packages
  (packages (append (list git vim curl wget nss-certs)
                    steelbore-fonts
                    %base-packages))

  ;; Services
  (services (append (list (service dhcp-client-service-type)
                          (service openssh-service-type)
                          ;; Desktop Services placeholder - will expand in desktop.scm
                          (service ntp-service-type))
                    %base-services)))
