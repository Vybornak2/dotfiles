#!/usr/bin/env bash

log_info "Installing core packages"
apt_install \
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
