#!/usr/bin/env bash

log_info "Cleaning apt cache and unused packages"
sudo apt-get autoremove -y
sudo apt-get autoclean -y

log_info "Cleanup complete"
