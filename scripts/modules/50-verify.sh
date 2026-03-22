#!/usr/bin/env bash

log_info "Verifying key tools"
for cmd in zsh nvim code git rg fdfind lua luarocks kitty; do
  if command -v "$cmd" >/dev/null 2>&1; then
    log_info "OK: $cmd"
  else
    log_warn "Missing: $cmd"
  fi
done

log_info "Validating zsh config syntax"
zsh -n "$HOME/.zshrc"
