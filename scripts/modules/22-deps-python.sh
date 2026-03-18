#!/usr/bin/env bash

log_info "Installing Python toolchain"
apt_install \
  python3 \
  python3-pip \
  python3-venv

if ! command -v uv >/dev/null 2>&1; then
  log_info "Installing uv"
  curl -LsSf https://astral.sh/uv/install.sh | sh
else
  log_info "uv already installed"
fi

UV_BIN="$(command -v uv || true)"
if [[ -z "$UV_BIN" && -x "$HOME/.local/bin/uv" ]]; then
  UV_BIN="$HOME/.local/bin/uv"
fi

if [[ -n "$UV_BIN" ]]; then
  log_info "uv available at: $UV_BIN"
else
  log_error "uv installation completed but uv binary was not found."
  exit 1
fi
