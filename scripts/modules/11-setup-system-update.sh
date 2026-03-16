#!/usr/bin/env bash

log_info "Updating apt package index"
apt_update

log_info "Upgrading installed packages"
apt_upgrade
