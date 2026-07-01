#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="$SCRIPT_DIR/lib"

# shellcheck source=lib/common.sh
source "$LIB_DIR/common.sh"

ensure_supported_os
ensure_sudo

shopt -s nullglob
MODULE_PATHS=( "$SCRIPT_DIR"/[0-9][0-9]-*.sh )
shopt -u nullglob

if [[ ${#MODULE_PATHS[@]} -eq 0 ]]; then
  log_error "No module scripts found (expected [0-9][0-9]-*.sh in $SCRIPT_DIR)"
  exit 1
fi

failures=()

for module_path in "${MODULE_PATHS[@]}"; do
  module="$(basename "$module_path")"

  printf "[..] %s\n" "$module"

  set +e
  bash "$module_path"
  status=$?
  set -e

  if [[ $status -eq 0 ]]; then
    printf "[done] %s\n" "$module"
  else
    printf "[fail] %s (exit %d)\n" "$module" "$status" >&2
    failures+=("$module")
  fi
done

if [[ ${#failures[@]} -gt 0 ]]; then
  log_error "Installer completed with ${#failures[@]} failed module(s): ${failures[*]}"
  exit 1
fi
