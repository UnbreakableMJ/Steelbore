# Steelbore Csh Theme
# Add to ~/.cshrc

# Colors (ANSI Escape Sequences)
set  red="%{\033[38;2;255;92;92m%}"   # Red Oxide
set green="%{\033[38;2;80;250;123m%}" # Radium Green
set  blue="%{\033[38;2;75;126;176m%}" # Steel Blue
set amber="%{\033[38;2;217;142;50m%}" # Molten Amber
set reset="%{\033[0m%}"

# Prompt: [Steel Blue Dir] [Amber %] 
set prompt = "${blue}%~ ${amber}%# ${reset}"

# Clean up variables
unset red green blue amber reset