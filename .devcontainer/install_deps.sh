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
    sudo \
    zsh

sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

cat << 'EOF' > /etc/sudoers.d/devcontainer
Cmnd_Alias CHOWN_CACHE = /usr/bin/chown -R vscode\:vscode /home/vscode/.cache/
Cmnd_Alias CHOWN_WORKSPACES = /usr/bin/chown -R vscode\:vscode /workspaces/
vscode ALL=(root) NOPASSWD: CHOWN_CACHE, CHOWN_WORKSPACES
EOF

cat << 'EOF' > /etc/skel/.zshrc
autoload -Uz compinit
compinit

# Hidden files completion
_comp_options+=(globdots)

source /usr/lib/git-core/git-sh-prompt
setopt PROMPT_SUBST
PROMPT='%F{green}%n %F{blue}%d %F{cyan}(%F{red}$(__git_ps1 "%s")%F{cyan})%f $ '
EOF
