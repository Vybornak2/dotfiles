#!/usr/bin/env bash

log_info "Installing extra CLI tools"
apt_install bat shellcheck

UV_BIN="$(command -v uv || true)"
if [[ -z "$UV_BIN" && -x "$HOME/.local/bin/uv" ]]; then
  UV_BIN="$HOME/.local/bin/uv"
fi

if [[ -n "$UV_BIN" ]]; then
  log_info "Installing Python developer tools via uv"
  "$UV_BIN" tool install ruff || true
  "$UV_BIN" tool install black || true
  "$UV_BIN" tool install isort || true
  "$UV_BIN" tool install mypy || true
  "$UV_BIN" tool install pyright || true
  "$UV_BIN" tool install flake8 || true
  "$UV_BIN" tool install pytest || true
  "$UV_BIN" tool install ipython || true
else
  log_warn "uv not found; skipping uv tool installs"
fi
