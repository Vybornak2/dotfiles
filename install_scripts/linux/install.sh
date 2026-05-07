#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="$SCRIPT_DIR/lib"

# shellcheck source=lib/common.sh
source "$LIB_DIR/common.sh"

ensure_supported_os
ensure_sudo

MODULES=(
  "10-setup-preflight.sh"
  "20-deps-core-packages.sh"
  "21-deps-cpp.sh"
  "22-deps-python.sh"
  "23-deps-rust.sh"
  "24-deps-lua.sh"
  "25-deps-fonts.sh"
  "30-tools-node.sh"
  "31-tools-kitty.sh"
  "32-tools-zsh.sh"
  "33-tools-nvim.sh"
  "34-tools-extra-cli.sh"
  "35-tools-docker.sh"
  "36-tools-vscode.sh"
  "37-tools-utftex.sh"
  "40-config-links.sh"
  "41-config-nvim-bootstrap.sh"
  "42-config-git.sh"
  "43-config-terminal.sh"
  "50-verify.sh"
  "51-cleanup.sh"
)

run_module_with_summary() {
  local module="$1"
  local module_path="$SCRIPT_DIR/$module"
  local fifo_dir
  local fifo_path
  local module_pid
  local status
  local line

  printf "[..] %s\n" "$module"

  fifo_dir="$(mktemp -d)"
  fifo_path="$fifo_dir/output"
  mkfifo "$fifo_path"

  set +e
  LOG_FD=3 LOG_ERR_FD=3 "$module_path" 3>"$fifo_path" >/dev/null 2>&1 &
  module_pid=$!

  exec 4<"$fifo_path"

  while :; do
    if IFS= read -r -t 0.2 line <&4; then
      printf "    %s\n" "$line"
    else
      if ! kill -0 "$module_pid" >/dev/null 2>&1; then
        break
      fi
    fi
  done

  wait "$module_pid" >/dev/null 2>&1
  status=$?
  set -e

  while IFS= read -r -t 0.05 line <&4; do
    if [[ -n "$line" ]]; then
      printf "    %s\n" "$line"
    fi
  done

  exec 4<&-
  rm -rf "$fifo_dir"

  if [[ $status -eq 0 ]]; then
    printf "[done] %s\n" "$module"
  else
    printf "[fail] %s (exit %d)\n" "$module" "$status" >&2
  fi

  return $status
}

failures=()

for module in "${MODULES[@]}"; do
  if ! run_module_with_summary "$module"; then
    failures+=("$module")
  fi
done

if [[ ${#failures[@]} -gt 0 ]]; then
  log_error "Installer completed with ${#failures[@]} failed module(s): ${failures[*]}"
  exit 1
fi
