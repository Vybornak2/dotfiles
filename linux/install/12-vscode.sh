#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"

log_info "Installing VS Code"

if command -v code >/dev/null 2>&1; then
  log_info "VS Code already installed"
  exit 0
fi

ensure_base_tools

log_info "Configuring Microsoft VS Code repository"

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc || true

sudo tee /etc/yum.repos.d/vscode.repo >/dev/null <<'EOF'
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
autorefresh=1
type=rpm-md
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf check-update || true
sudo dnf -y install code || log_warn "Failed to install 'code' via dnf; ensure the repository is available."
