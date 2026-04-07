#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

log_info "Installing C/C++ toolchain"
sudo apt-get install -y \
  autoconf \
  automake \
  build-essential \
  clang \
  clangd \
  cmake \
  g++ \
  gcc \
  gdb \
  gettext \
  libreadline-dev \
  libtool \
  libtool-bin \
  ninja-build \
  pkg-config
