#!/usr/bin/env bash

log_info "Installing language toolchain dependencies"
apt_install \
  autoconf \
  automake \
  build-essential \
  clang \
  clangd \
  cmake \
  gettext \
  g++ \
  gcc \
  gdb \
  libtool \
  libtool-bin \
  ninja-build \
  pkg-config \
  python3 \
  python3-pip \
  python3-venv

if ! command -v rustup >/dev/null 2>&1; then
  log_info "Installing rustup"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
  log_info "rustup already installed"
fi

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
