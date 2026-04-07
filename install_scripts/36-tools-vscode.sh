#!/usr/bin/env bash

if ! declare -F log_info >/dev/null 2>&1; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  # shellcheck source=lib/common.sh
  source "$SCRIPT_DIR/lib/common.sh"
fi

if ! command -v code >/dev/null 2>&1; then
  log_info "Installing Visual Studio Code"
  sudo apt-get install -y apt-transport-https
  sudo install -d -m 0755 /usr/share/keyrings
  sudo install -d -m 0755 /etc/apt/sources.list.d

  if [[ ! -f /usr/share/keyrings/microsoft.gpg ]]; then
    curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft.gpg >/dev/null
    sudo chmod 0644 /usr/share/keyrings/microsoft.gpg
  fi

  if [[ ! -f /etc/apt/sources.list.d/vscode.sources ]]; then
    sudo tee /etc/apt/sources.list.d/vscode.sources >/dev/null <<EOF
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: $(dpkg --print-architecture)
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF
  fi

  sudo apt-get update
  sudo apt-get install -y code
else
  log_info "Visual Studio Code already installed"
fi

if command -v code >/dev/null 2>&1; then
  log_info "Installing VS Code extensions"
  code --install-extension ms-python.python --force || true
  code --install-extension ms-python.vscode-pylance --force || true
  code --install-extension charliermarsh.ruff --force || true
  code --install-extension rust-lang.rust-analyzer --force || true
  code --install-extension ms-vscode.cpptools --force || true
  code --install-extension llvm-vs-code-extensions.vscode-clangd --force || true
  code --install-extension ms-toolsai.jupyter --force || true
  code --install-extension vscodevim.vim --force || true
  code --install-extension GitHub.copilot-chat --force || true
  code --install-extension GitHub.vscode-pull-request-github --force || true
  code --install-extension pkief.material-icon-theme --force || true
  code --install-extension njpwerner.autodocstring --force || true
  code --install-extension aaron-bond.better-comments --force || true
else
  log_warn "VS Code binary not found; skipping extension install"
fi
