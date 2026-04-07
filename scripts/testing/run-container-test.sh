#!/usr/bin/env bash
set -euo pipefail

# Usage examples:
#   scripts/testing/run-container-test.sh
#   scripts/testing/run-container-test.sh
IMAGE_NAME="dotfiles-installer-test:latest"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

if ! command -v docker >/dev/null 2>&1; then
  echo "[ERROR] Container engine not found: docker" >&2
  echo "Install Docker and ensure the daemon is running." >&2
  exit 1
fi

DOCKER=(docker)
if command -v sudo >/dev/null 2>&1; then
  DOCKER=(sudo docker)
  echo "[INFO] Using sudo docker"
fi

echo "[INFO] Building test image with ${DOCKER[*]}"
"${DOCKER[@]}" build -t "$IMAGE_NAME" -f "$SCRIPT_DIR/Dockerfile.installer-test" "$REPO_ROOT"

echo "[INFO] Running installer in container"
"${DOCKER[@]}" run --rm \
  -e DEBIAN_FRONTEND=noninteractive \
  -e TZ=Etc/UTC \
  -v "$REPO_ROOT:/workspace" \
  -w /workspace \
  "$IMAGE_NAME" \
  bash -lc 'bash scripts/install.sh'
