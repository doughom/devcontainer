#!/bin/bash
set -eu

snapshot_date="$1"

apt install --yes --update --snapshot "$snapshot_date" --no-install-recommends \
    fd-find \
    nano \
    ripgrep

useradd --create-home --shell /bin/zsh agent
