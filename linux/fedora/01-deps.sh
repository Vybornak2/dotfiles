#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

log_info "Installing dnf packages"

mkdir -p "$HOME/.config" "$HOME/.local/bin" "$HOME/Projects" "$SRC_DIR"

sudo dnf -y makecache

# Allow comments and blank lines in packages.txt
grep -vE '^\s*($|#)' "$SCRIPT_DIR/packages.txt" \
  | xargs -r sudo dnf -y install
