# Steelbore Zsh Theme
# Add to ~/.zshrc

autoload -Uz vcs_info
precmd() { vcs_info }

# Styling the VCS (Git) info
zstyle ':vcs_info:*' formats ' %F{#D98E32}on  %b%f'
zstyle ':vcs_info:*' actionformats ' %F{#D98E32}on  %b|%a%f'

# Prompt Definition
setopt PROMPT_SUBST

# Left: Dir + Git + Status
# %F{...} supports hex in modern Zsh
PROMPT='%F{#4B7EB0}%~${vcs_info_msg_0_} %(?.%F{#50FA7B}❯.%F{#FF5C5C}❯) %f'

# Right: Time (dimmed in Slag Grey)
RPROMPT='%F{#6272A4}%* ms%f'