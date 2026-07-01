#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

ensure_base_tools

log_info "Installing Python tooling (uv)"

if ! command -v uv >/dev/null 2>&1; then
  log_info "Installing uv (upstream installer)"
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

if ! command -v uv >/dev/null 2>&1; then
  log_error "uv installation completed but uv binary was not found on PATH."
else
  log_info "uv available: $(uv --version)"
fi

log_info "Ensuring Rust toolchain"


if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

