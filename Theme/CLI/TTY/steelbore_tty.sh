#!/bin/sh

if [ "$TERM" = "linux" ]; then
    # Steelbore Palette Definition
    # Format: \e]P{Index}{HexColor}
    
    # 0-7: Standard Colors
    printf "\e]P0000027" # Black (Void Navy Base)
    printf "\e]P1FF5C5C" # Red (Red Oxide)
    printf "\e]P250FA7B" # Green (Radium Green)
    printf "\e]P3D98E32" # Yellow (Molten Amber)
    printf "\e]P44B7EB0" # Blue (Steel Blue)
    printf "\e]P5BD93F9" # Magenta (Electric Arc)
    printf "\e]P68BE9FD" # Cyan (Liquid Cool)
    printf "\e]P7E6E6F0" # White (Chrome White)
    
    # 8-15: Bright Colors
    printf "\e]P86272A4" # Bright Black (Slag Grey)
    printf "\e]P9FF6E6E" # Bright Red
    printf "\e]PA69FF94" # Bright Green
    printf "\e]PBFFFFA5" # Bright Yellow
    printf "\e]PCD6ACFF" # Bright Blue
    printf "\e]PDFF92DF" # Bright Magenta
    printf "\e]PEA4FFFF" # Bright Cyan
    printf "\e]PFFFFFFF" # Bright White
    
    # Set default foreground (white) and background (black/void navy)
    # \e[37m = White text, \e[40m = Black background
    printf "\e[37;40m"
    
    # Clear screen to apply
    clear
fi