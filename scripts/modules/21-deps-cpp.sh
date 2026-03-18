#!/usr/bin/env bash

log_info "Installing C/C++ toolchain"
apt_install \
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
