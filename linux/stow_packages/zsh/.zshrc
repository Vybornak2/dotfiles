##################### Prompt bootstrap #####################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###################### Shell identity ######################
typeset -U path PATH
export EDITOR="nvim"
export VISUAL="nvim"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

####################### Prompt theme #######################
[[ -r "$HOME/.powerlevel10k/powerlevel10k.zsh-theme" ]] && source "$HOME/.powerlevel10k/powerlevel10k.zsh-theme"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

######################## PATH setup ########################
[[ -d "$HOME/.local/bin" ]] && path+=("$HOME/.local/bin")
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"
[[ -d "$HOME/.cargo/bin" ]] && path+=("$HOME/.cargo/bin")
[[ -d "$HOME/.npm-global/bin" ]] && path+=("$HOME/.npm-global/bin")
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"

################## Cross-Platform Adaptations ##############
# 1. Dynamically source FZF from the correct OS location safely
if [[ -f /usr/share/fzf/completion.zsh ]]; then
  # Arch Linux paths
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
elif [[ -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
  # Ubuntu / Pop!_OS paths
  source /usr/share/doc/fzf/examples/completion.zsh
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

# 2. Assign the right binary variant for FD (fd vs fdfind)
if command -v fd &>/dev/null; then
  FD_CMD="fd"
elif command -v fdfind &>/dev/null; then
  FD_CMD="fdfind"
else
  FD_CMD="find"
fi

export FZF_DEFAULT_COMMAND="$FD_CMD --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FD_CMD --type d --strip-cwd-prefix --hidden --follow --exclude .git"

######################## Oh My Zsh #########################
zstyle ':omz:update' mode auto 
zstyle ':omz:update' frequency 13

plugins=(
  git
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
  python
  zoxide
)

# Python plugin settings
PYTHON_AUTO_VRUN=true
PYTHON_VENV_NAME=".venv"

######################### Aliases ##########################
alias hh='cd ~'
alias dt='cd ~/Desktop'
alias pr='cd ~/Projects'
alias ipy='uv tool run ipython'
alias nv='nvim'
alias ai='ollama run qwen2.5-coder:7b'
alias ai_web='open-webui serve > /dev/null 2>&1 & sleep 5 && xdg-open http://localhost:8080'
alias ai_web_stop='pkill -f "open-webui serve"'

#################### Completion system #####################
fpath=(~/.zsh/completions $fpath)
fpath=(/usr/local/share/zsh/site-functions /usr/share/zsh/vendor-completions $fpath)

source "$ZSH/oh-my-zsh.sh"

autoload -U compinit
compinit -i

######################### Keybinds #########################
bindkey '^@' menu-select         # Ctrl+Space triggers the menu
bindkey '^[y' autosuggest-accept # Alt+y accepts autosuggestions
