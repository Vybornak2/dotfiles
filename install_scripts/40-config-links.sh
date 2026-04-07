#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NVIM_SOURCE="$DOTFILES_ROOT/nvim"
NVIM_TARGET="$HOME/.config/nvim"
KITTY_SOURCE="$DOTFILES_ROOT/kitty"
KITTY_TARGET="$HOME/.config/kitty"
VSCODE_USER_DIR="$HOME/.config/Code/User"
P10K_SOURCE="$DOTFILES_ROOT/.p10k.zsh"
P10K_TARGET="$HOME/.p10k.zsh"

log_info "Creating config directories"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$VSCODE_USER_DIR"

log_info "Linking dotfiles"
ln -sfn "$DOTFILES_ROOT/.zshrc" "$HOME/.zshrc"

if [[ -e "$P10K_TARGET" && ! -L "$P10K_TARGET" ]]; then
	backup_path="${P10K_TARGET}.bak.$(date +%Y%m%d%H%M%S)"
	mv "$P10K_TARGET" "$backup_path"
	log_warn "Existing p10k config moved to: $backup_path"
fi

ln -sfn "$P10K_SOURCE" "$P10K_TARGET"
log_info "Powerlevel10k config deployed via symlink"

if [[ -e "$NVIM_TARGET" && ! -L "$NVIM_TARGET" ]]; then
	backup_path="${NVIM_TARGET}.bak.$(date +%Y%m%d%H%M%S)"
	mv "$NVIM_TARGET" "$backup_path"
	log_warn "Existing nvim config moved to: $backup_path"
fi

ln -sfn "$NVIM_SOURCE" "$NVIM_TARGET"
log_info "Neovim config deployed via symlink"

if [[ -e "$KITTY_TARGET" && ! -L "$KITTY_TARGET" ]]; then
	backup_path="${KITTY_TARGET}.bak.$(date +%Y%m%d%H%M%S)"
	mv "$KITTY_TARGET" "$backup_path"
	log_warn "Existing kitty config moved to: $backup_path"
fi

ln -sfn "$KITTY_SOURCE" "$KITTY_TARGET"
log_info "Kitty config deployed via symlink"

ln -sfn "$DOTFILES_ROOT/settings.json" "$VSCODE_USER_DIR/settings.json"
log_info "VS Code settings deployed via symlink"

log_info "Ensuring ~/.local/bin/env exists"
touch "$HOME/.local/bin/env"
