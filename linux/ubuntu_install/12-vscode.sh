#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

log_info "Installing VS Code"

if command -v code >/dev/null 2>&1; then
  log_info "VS Code already installed"
  exit 0
fi

ensure_base_tools

sudo install -d -m 0755 /usr/share/keyrings
sudo install -d -m 0755 /etc/apt/sources.list.d

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
sudo chmod 0644 /usr/share/keyrings/microsoft.gpg

sudo tee /etc/apt/sources.list.d/vscode.sources >/dev/null <<'EOF'
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y code

log_info "VS Code extensions auto-install is disabled (settings are linked via stow)"
