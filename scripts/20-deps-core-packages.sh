#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

log_info "Installing core packages"
sudo apt-get install -y \
  ca-certificates \
  chafa \
  curl \
  fd-find \
  fzf \
  git \
  gpg \
  jq \
  make \
  ripgrep \
  software-properties-common \
  tree \
  unzip \
  wget \
  wl-clipboard \
  xclip \
  zip
