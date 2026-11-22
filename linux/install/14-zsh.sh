#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

if ! command -v zsh >/dev/null 2>&1; then
  log_warn "zsh not found (expected to be installed by the dnf step)"
fi

if ! command -v zoxide >/dev/null 2>&1; then
  log_warn "zoxide not found (expected to be installed by the dnf step)"
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  log_info "Installing Oh My Zsh (git clone)"
  git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
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

