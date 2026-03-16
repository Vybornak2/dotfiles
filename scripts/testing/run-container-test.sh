#!/usr/bin/env bash
set -euo pipefail

# Usage examples:
#   scripts/testing/run-container-test.sh
#   CONTAINER_ENGINE=podman scripts/testing/run-container-test.sh
#   scripts/testing/run-container-test.sh --only 33-tools-vscode.sh
#   scripts/testing/run-container-test.sh --skip 51-cleanup.sh

ENGINE="${CONTAINER_ENGINE:-docker}"
IMAGE_NAME="dotfiles-installer-test:latest"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

if ! command -v "$ENGINE" >/dev/null 2>&1; then
  echo "[ERROR] Container engine not found: $ENGINE" >&2
  echo "Set CONTAINER_ENGINE=docker|podman and ensure it is installed." >&2
  exit 1
fi

echo "[INFO] Building test image with $ENGINE"
"$ENGINE" build -t "$IMAGE_NAME" -f "$SCRIPT_DIR/Dockerfile.installer-test" "$REPO_ROOT"

echo "[INFO] Running installer in container"
"$ENGINE" run --rm -it \
  -v "$REPO_ROOT:/workspace" \
  -w /workspace \
  "$IMAGE_NAME" \
  bash -lc 'bash scripts/install.sh --skip 51-cleanup.sh "$@"' _ "$@"
