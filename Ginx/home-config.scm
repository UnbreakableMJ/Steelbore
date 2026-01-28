;; Project Ginx - Guix Home Configuration
;;
;; Manages dotfiles and user environment for 'mj'.
;;

(use-modules (gnu home)
             (gnu home services)
             (gnu home services shells)
             (gnu services)
             (guix gexp)
             (gnu home services xdg))

(home-environment
  (packages (list)) ;; Managed by system mostly, but user-specifics go here

  (services
   (list
    ;; Shell Configuration (Bash defaults for safety, Nushell managed via config file)
    (service home-bash-service-type
             (home-bash-configuration
              (aliases '(("ll" . "ls -l")
                         ("la" . "ls -la")
                         ("gs" . "git status")))))

    ;; Environment Variables (Input Method & Theme)
    (simple-service 'steelbore-env-vars-service
                    home-environment-variables-service-type
                    '(("STEELBORE_THEME" . "true")
                      ("EDITOR" . "hx")
                      ("XKB_DEFAULT_LAYOUT" . "us,ar")
                      ("XKB_DEFAULT_OPTIONS" . "grp:ctrl_space_toggle")))

    ;; Dotfiles Management (Ported from Lattice)
    (service home-xdg-configuration-files-service-type
             (list
              ;; Niri
              ("niri/config.kdl"
               (plain-file "config.kdl"
                           (string-append
                            "layout {\n"
                            "    focus-ring {\n"
                            "        enable\n"
                            "        width 2\n"
                            "        active-color \"#D98E32\"\n"
                            "        inactive-color \"#4B7EB0\"\n"
                            "    }\n"
                            "    border {\n"
                            "        off\n"
                            "        width 1\n"
                            "        active-color \"#D98E32\"\n"
                            "        inactive-color \"#4B7EB0\"\n"
                            "    }\n"
                            "    gaps 8\n"
                            "}\n"
                            "spawn-at-startup \"swaybg\" \"-c\" \"#000027\"\n"
                            "spawn-at-startup \"ironbar\"\n"
                            "binds {\n"
                            "    Mod+Shift+E { quit; }\n"
                            "    Mod+Return { spawn \"alacritty\"; }\n"
                            "    Mod+D { spawn \"onagre\"; }\n"
                            "    Mod+Q { close-window; }\n"
                            "    Mod+Left  { focus-column-left; }\n"
                            "    Mod+Right { focus-column-right; }\n"
                            "    Mod+Up    { focus-window-up; }\n"
                            "    Mod+Down  { focus-window-down; }\n"
                            "}\n")))

              ;; Alacritty
              ("alacritty/alacritty.toml"
               (plain-file "alacritty.toml"
                           (string-append
                            "[window]\n"
                            "padding = { x = 10, y = 10 }\n"
                            "dynamic_title = true\n"
                            "opacity = 0.95\n"
                            "[font]\n"
                            "normal = { family = \"Cascadia Code\", style = \"Regular\" }\n"
                            "size = 12.0\n"
                            "[colors.primary]\n"
                            "background = \"#000027\"\n"
                            "foreground = \"#D98E32\"\n"
                            "[colors.selection]\n"
                            "text = \"#000027\"\n"
                            "background = \"#4B7EB0\"\n")))
              
              ;; Ironbar
              ("ironbar/config.yaml"
               (plain-file "config.yaml"
                           "anchor_to_edges: true\nposition: top\nstart:\n  - type: workspaces\n  - type: focused\ncenter:\n  - type: clock\n    format: \"%H:%M:%S :: %Y-%m-%d\"\nend:\n  - type: sys_info\n    interval: 1\n    format: \"CPU: {cpu_percent}% | RAM: {memory_percent}%\"\n  - type: tray\n"))
              
              ("ironbar/style.css"
               (plain-file "style.css"
                           "* { font-family: \"Share Tech Mono\", monospace; font-size: 14px; transition: none; }\nwindow { background-color: #000027; color: #D98E32; border-bottom: 2px solid #4B7EB0; }\n.widget { padding: 0 10px; border-left: 1px solid #4B7EB0; }\n"))

              ;; Nushell Config
              ("nushell/config.nu"
               (plain-file "config.nu"
                           (string-append
                            "$env.config = {\n"
                            "  show_banner: false,\n"
                            "  ls: { use_ls_colors: true, clickable_links: true },\n"
                            "  cursor_shape: { emacs: block, vi_insert: block, vi_normal: block },\n"
                            "}\n"
                            "alias ll = ls -l\n"
                            "alias lla = ls -la\n"
                            "alias telemetry = macchina\n"
                            "def steelbore [] {\n"
                            "  print \"STEELBORE :: Industrial Sci-Fi Utility Environment\"\n"
                            "  print \"STATUS    :: ACTIVE\"\n"
                            "}\n")))
              
              ;; Starship
              ("starship.toml"
               (plain-file "starship.toml"
                           (string-append
                            "format = \"$directory$git_branch$git_status$cmd_duration$character\"\n"
                            "[directory]\nstyle = \"bold #4B7EB0\"\ntruncate_to_repo = true\n"
                            "[character]\nsuccess_symbol = \"[➜](bold #50FA7B)\"\nerror_symbol = \"[✗](bold #FF5C5C)\"\n")))
              )))))
