##################### Prompt bootstrap #####################
# Load the prompt as early as possible so startup stays snappy.
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
# Prefer the terminal app, local bins, and language toolchains before system paths.
[[ -d "$HOME/.local/kitty.app/bin" ]] && path=("$HOME/.local/kitty.app/bin" $path)
[[ -d "$HOME/.local/bin" ]] && path+=("$HOME/.local/bin")
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"
[[ -d "$HOME/.cargo/bin" ]] && path+=("$HOME/.cargo/bin")
[[ -d "$HOME/.npm-global/bin" ]] && path+=("$HOME/.npm-global/bin")
[[ -d "/opt/nvim-linux-x86_64/bin" ]] && path+=("/opt/nvim-linux-x86_64/bin")
[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
[ -s "$HOME/.nvm/bash_completion" ] && \. "$HOME/.nvm/bash_completion"

################## External integrations ###################
# fzf completion and key bindings.
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fdfind --type d --strip-cwd-prefix --hidden --follow --exclude .git'

#################### Completion system #####################
fpath=(/usr/local/share/zsh/site-functions /usr/share/zsh/vendor-completions $fpath)
autoload -U compinit
compinit -i

######################## Oh My Zsh #########################
zstyle ':omz:update' mode auto # Keep Oh My Zsh updates automatic.
zstyle ':omz:update' frequency 13

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
  python
  zoxide
)

# Python plugin settings
PYTHON_AUTO_VRUN=true
PYTHON_VENV_NAME=".venv"

source "$ZSH/oh-my-zsh.sh"

######################## Shortcuts #########################
alias hh='cd ~'
alias dt='cd ~/Desktop'
alias pr='cd ~/Projects'
alias ipy='uv tool run ipython'
