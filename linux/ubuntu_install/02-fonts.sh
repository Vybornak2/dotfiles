#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

log_info "Installing fonts"
ensure_base_tools

FONT_TARGET_DIR="$HOME/.local/share/fonts/JetBrainsMonoNerd"
FONT_SRC_DIR="$SRC_DIR/fonts"
FONT_ZIP="$FONT_SRC_DIR/JetBrainsMono.zip"

if [[ ! -d "$FONT_TARGET_DIR" ]]; then
  log_info "Installing JetBrainsMono Nerd Font"

  mkdir -p "$FONT_SRC_DIR"
  mkdir -p "$FONT_TARGET_DIR"

  curl -fsSL -o "$FONT_ZIP" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
  unzip -q "$FONT_ZIP" -d "$FONT_TARGET_DIR"
  fc-cache -f "$HOME/.local/share/fonts" || true
else
  log_info "JetBrainsMono Nerd Font already installed"
fi
