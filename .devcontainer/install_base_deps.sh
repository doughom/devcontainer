#!/bin/bash
set -eu

snapshot_date="$1"

cat << EOF > /etc/apt/apt.conf.d/devcontainer
# Ignore expired release files for snapshots
Acquire::Check-Valid-Until false;
# Retry temporary HTTP errors
Acquire::Retries "3";
EOF

# Snapshot dependencies
apt install --yes --update --no-install-recommends ca-certificates

# Base devcontainer packages
apt upgrade --yes --update --snapshot "$snapshot_date"
apt install --yes --update --snapshot "$snapshot_date" --no-install-recommends \
    git \
    locales \
    zsh

sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
