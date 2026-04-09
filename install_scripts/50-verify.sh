#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

log_info "Verifying key tools"
for cmd in zsh nvim code docker git rg fdfind lua luarocks kitty utftex; do
  if command -v "$cmd" >/dev/null 2>&1; then
    log_info "OK: $cmd"
  else
    log_warn "Missing: $cmd"
  fi
done

if command -v zsh >/dev/null 2>&1; then
  log_info "Validating zsh config syntax"
  zsh -n "$HOME/.zshrc"
else
  log_warn "zsh not found; skipping zsh config validation"
fi
