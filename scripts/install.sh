#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="$SCRIPT_DIR/lib"
MODULE_DIR="$SCRIPT_DIR/modules"

# shellcheck source=lib/common.sh
source "$LIB_DIR/common.sh"

print_header "Dotfiles Installer"
ensure_supported_os
ensure_sudo

# Ordered modules. Keep numeric prefixes to enforce a stable flow.
MODULES=(
  "10-setup-preflight.sh"
  "11-setup-system-update.sh"
  "20-deps-core-packages.sh"
  "21-deps-cpp.sh"
  "22-deps-python.sh"
  "23-deps-rust.sh"
  "24-deps-lua.sh"
  "25-deps-fonts.sh"
  "30-tools-zsh.sh"
  "31-tools-nvim.sh"
  "32-tools-extra-cli.sh"
  "33-tools-vscode.sh"
  "40-config-links.sh"
  "41-config-nvim-bootstrap.sh"
  "42-config-git.sh"
  "50-verify.sh"
  "51-cleanup.sh"
)

# Optional module filtering:
#   ./scripts/install.sh --from 30-tools-zsh.sh
#   ./scripts/install.sh --only 33-tools-vscode.sh
#   ./scripts/install.sh --skip 51-cleanup.sh
FROM_MODULE=""
ONLY_MODULE=""
SKIP_MODULE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --from)
      FROM_MODULE="${2:-}"
      shift 2
      ;;
    --only)
      ONLY_MODULE="${2:-}"
      shift 2
      ;;
    --skip)
      SKIP_MODULE="${2:-}"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

start_running="false"
for module in "${MODULES[@]}"; do
  if [[ -n "$ONLY_MODULE" && "$module" != "$ONLY_MODULE" ]]; then
    continue
  fi

  if [[ -n "$FROM_MODULE" && "$start_running" == "false" ]]; then
    if [[ "$module" == "$FROM_MODULE" ]]; then
      start_running="true"
    else
      continue
    fi
  else
    start_running="true"
  fi

  if [[ -n "$SKIP_MODULE" && "$module" == "$SKIP_MODULE" ]]; then
    log_warn "Skipping module: $module"
    continue
  fi

  run_module "$MODULE_DIR/$module"
done

print_header "Installer Finished"
log_info "All requested modules completed."
