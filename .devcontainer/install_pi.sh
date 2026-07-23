#!/bin/bash
set -eu

snapshot_date="$1"

apt install --yes --update --snapshot "$snapshot_date" --no-install-recommends \
    fd-find \
    nano \
    ripgrep

mkdir -p /etc/skel/.pi/agent

cat << EOF > /etc/skel/.pi/agent/models.json
{
    "providers": {
        "lmstudio": {
            "baseUrl": "http://host.docker.internal:1234/v1",
            "api": "openai-completions",
            "apiKey": "lmstudio",
            "models": [
                {
                    "id": "google/gemma-4-12b-qat"
                }
            ]
        }
    }
}
EOF

cat << EOF > /etc/skel/.pi/agent/settings.json
{
    "defaultProvider": "lmstudio",
    "defaultModel": "google/gemma-4-12b-qat"
}
EOF

useradd --create-home --shell /bin/zsh agent
