# Steelbore Bash Theme
# Add to ~/.bashrc

steelbore_prompt() {
    local EXIT_CODE=$?
    
    # Color Definitions (TrueColor)
    local C_RESET="\[\e[0m\]"
    local C_DIR="\[\e[38;2;75;126;176m\]"   # Steel Blue
    local C_GIT="\[\e[38;2;217;142;50m\]"   # Molten Amber
    local C_SUCCESS="\[\e[38;2;80;250;123m\]" # Radium Green
    local C_FAIL="\[\e[38;2;255;92;92m\]"     # Red Oxide
    
    # Git Branch Detection
    local GIT_BRANCH=""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        GIT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)
        GIT_BRANCH=" ${C_GIT}on  ${GIT_BRANCH}"
    fi

    # Status Indicator
    local STATUS_SYMBOL="❯"
    local STATUS_COLOR=$C_SUCCESS
    if [ $EXIT_CODE -ne 0 ]; then
        STATUS_COLOR=$C_FAIL
    fi

    # Assemble Prompt
    PS1="${C_DIR}\w${GIT_BRANCH} ${STATUS_COLOR}${STATUS_SYMBOL} ${C_RESET}"
}

PROMPT_COMMAND=steelbore_prompt