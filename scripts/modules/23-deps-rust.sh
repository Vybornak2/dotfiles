#!/usr/bin/env bash

log_info "Installing Rust toolchain"
if ! command -v rustup >/dev/null 2>&1; then
  log_info "Installing rustup"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
  log_info "rustup already installed: $(rustup --version)"
fi
