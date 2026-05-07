#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

if ! command -v kitty >/dev/null 2>&1; then
  log_info "Installing Kitty"
  if [[ ! -d "$HOME/.local/kitty.app" ]]; then
    KITTY_SRC_DIR="$SRC_DIR/kitty"
    KITTY_INSTALLER="$KITTY_SRC_DIR/installer.sh"
    mkdir -p "$KITTY_SRC_DIR"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh -o "$KITTY_INSTALLER"
    sh "$KITTY_INSTALLER"
  fi

  mkdir -p "$HOME/.local/bin"
  ln -sfn "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/bin/kitty"
  ln -sfn "$HOME/.local/kitty.app/bin/kitten" "$HOME/.local/bin/kitten"
else
  log_info "Kitty already installed"
fi
