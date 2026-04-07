#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

if ! command -v zsh >/dev/null 2>&1; then
  log_info "Installing zsh"
  sudo apt-get install -y zsh
else
  log_info "zsh already installed"
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  log_info "Installing Oh My Zsh"
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  log_info "Oh My Zsh already installed"
fi

if [[ ! -d "$HOME/.powerlevel10k" ]]; then
  log_info "Installing Powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.powerlevel10k"
else
  log_info "Powerlevel10k already installed"
fi

mkdir -p "$HOME/.oh-my-zsh/custom/plugins"

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
else
  log_info "zsh-autosuggestions already installed"
fi

if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
else
  log_info "zsh-syntax-highlighting already installed"
fi

if ! command -v zoxide >/dev/null 2>&1; then
  log_info "Installing zoxide"
  sudo apt-get install -y zoxide
else
  log_info "zoxide already installed"
fi
