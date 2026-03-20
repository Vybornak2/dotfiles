# Bootstrap prompt rendering early.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Dotfiles root.
DOTFILES_DIR="${${(%):-%N}:A:h}"

# Shell framework.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

# Plugins
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	sudo
	python
	zoxide
)

source "$ZSH/oh-my-zsh.sh"

# Prompt theme.
[[ -r "$HOME/.powerlevel10k/powerlevel10k.zsh-theme" ]] && source "$HOME/.powerlevel10k/powerlevel10k.zsh-theme"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Environment.
typeset -U path PATH
export EDITOR="nvim"
export VISUAL="nvim"

# Local user tools.
[[ -d "$HOME/.local/bin" ]] && path+=("$HOME/.local/bin")
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

# Language and app toolchains.
[[ -d "$HOME/.cargo/bin" ]] && path+=("$HOME/.cargo/bin")
[[ -d "$HOME/.npm-global/bin" ]] && path+=("$HOME/.npm-global/bin")
[[ -d "/opt/nvim-linux-x86_64/bin" ]] && path+=("/opt/nvim-linux-x86_64/bin")
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fuzzy finder
source /usr/share/doc/fzf/examples/completion.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh

# FZF shortcuts
export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fdfind --type d --strip-cwd-prefix --hidden --follow --exclude .git'

# Directory shortcuts.
alias hh='cd ~'
alias dt='cd ~/Desktop'
alias pr='cd ~/Projects'
alias dotfiles='cd "$DOTFILES_DIR"'

