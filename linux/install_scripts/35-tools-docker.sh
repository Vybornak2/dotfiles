#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

if ! command -v docker >/dev/null 2>&1; then
  log_info "Installing Docker"
  DOCKER_SRC_DIR="$SRC_DIR/docker"
  DOCKER_KEY="$DOCKER_SRC_DIR/docker.asc"
  mkdir -p "$DOCKER_SRC_DIR"

  # shellcheck disable=SC1091
  source /etc/os-release

  REMOVE_PACKAGES=()
  for pkg in docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc; do
    if dpkg -s "$pkg" >/dev/null 2>&1; then
      REMOVE_PACKAGES+=("$pkg")
    fi
  done

  if [[ ${#REMOVE_PACKAGES[@]} -gt 0 ]]; then
    sudo apt-get remove -y "${REMOVE_PACKAGES[@]}"
  fi

  sudo install -d -m 0755 /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o "$DOCKER_KEY"
  sudo install -m 0644 "$DOCKER_KEY" /etc/apt/keyrings/docker.asc

  sudo tee /etc/apt/sources.list.d/docker.sources >/dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: ${UBUNTU_CODENAME:-$VERSION_CODENAME}
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  docker_user="${SUDO_USER:-${USER:-}}"
  if [[ -n "$docker_user" && "$docker_user" != "root" ]]; then
    sudo usermod -aG docker "$docker_user"
    log_info "Docker installed; log out and back in to use docker without sudo."
  else
    log_warn "Docker installed; unable to determine a non-root user for the docker group."
  fi
else
  log_info "Docker already installed"
fi
