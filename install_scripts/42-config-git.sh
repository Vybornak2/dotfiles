#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

log_info "Configuring git"
git config --global user.name "Vybornak2"
git config --global user.email "jan.vyborny2@gmail.com"
git config --global init.defaultBranch "main"

log_info "Git config applied:"
git config --global -l | grep -E "^(user\.|init\.)" || true
