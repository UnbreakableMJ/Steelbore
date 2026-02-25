# Steelbore Fish Theme
# Add to ~/.config/fish/config.fish

# Syntax Highlighting Colors
set -g fish_color_normal D98E32          # Molten Amber (Default Text)
set -g fish_color_command 50FA7B         # Radium Green (Valid Commands)
set -g fish_color_keyword 4B7EB0         # Steel Blue
set -g fish_color_quote E6E6F0           # Chrome White
set -g fish_color_redirection 8BE9FD     # Liquid Cool
set -g fish_color_end FF5C5C             # Red Oxide
set -g fish_color_error FF5C5C           # Red Oxide
set -g fish_color_param 8BE9FD           # Liquid Cool
set -g fish_color_comment 6272A4         # Slag Grey
set -g fish_color_selection --background=4B7EB0
set -g fish_color_search_match --background=4B7EB0
set -g fish_color_operator 50FA7B
set -g fish_color_escape 8BE9FD
set -g fish_color_autosuggestion 6272A4

# The Prompt Function
function fish_prompt
    set -l last_status $status
    
    # Dir (Steel Blue)
    set_color 4B7EB0
    printf '%s' (prompt_pwd)
    set_color normal

    # Git (Molten Amber)
    if type -q git
        set -l branch (git branch --show-current 2>/dev/null)
        if test -n "$branch"
            set_color D98E32
            printf ' on  %s' $branch
            set_color normal
        end
    end

    # Status Symbol
    if test $last_status -eq 0
        set_color 50FA7B
        printf ' ❯ '
    else
        set_color FF5C5C
        printf ' ❯ '
    end
    set_color normal
end