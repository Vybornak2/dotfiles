#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
STOW_DIR="$DOTFILES_ROOT/linux/stow_packages"

backup_conflict() {
  local path="$1"
  if [[ -e "$path" && ! -L "$path" ]]; then
    local backup_path
    backup_path="${path}.bak.$(date +%Y%m%d%H%M%S)"
    mv "$path" "$backup_path"
    log_warn "Existing path moved to: $backup_path"
  fi
}

log_info "Preparing dotfile symlinks via stow"

if ! command -v stow >/dev/null 2>&1; then
  log_error "stow not found; ensure core packages were installed"
  exit 1
fi

if [[ ! -d "$STOW_DIR" ]]; then
  log_error "stow package directory not found: $STOW_DIR"
  exit 1
fi

# Back up common conflict targets (stow will refuse to overwrite real files/dirs)
backup_conflict "$HOME/.zshrc"
backup_conflict "$HOME/.p10k.zsh"
backup_conflict "$HOME/.config/nvim"
backup_conflict "$HOME/.config/Code/User/settings.json"
backup_conflict "$HOME/.config/alacritty"

log_info "Stowing packages: zsh, nvim, vscode, alacritty"
(
  cd "$STOW_DIR" || exit 1
  stow --target "$HOME" --restow zsh nvim vscode alacritty
)

log_info "Ensuring ~/.local/bin/env exists"
mkdir -p "$HOME/.local/bin"
touch "$HOME/.local/bin/env"
