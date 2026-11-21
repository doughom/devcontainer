# https://hub.docker.com/r/astral/uv/tags
FROM astral/uv:0.13.7@sha256:96f40d3904aad8d0bd010539001d36c8e2188b981e1334471a90c4a1d93bb490 AS uv
# https://hub.docker.com/_/python/tags?name=slim-trixie
FROM python:3.14.10-slim-trixie@sha256:9aaa474097d094040649f2162a627c0049b408f52138d980916788d80f04802f as devcontainer
COPY --from=uv /uv /uvx /usr/local/bin/

ENV APT_SNAPSHOT_DATE="20261023T000000Z"
RUN --mount=type=bind,source=install_deps.sh,target=/tmp/install_deps.sh /tmp/install_deps.sh ${APT_SNAPSHOT_DATE}
RUN useradd --create-home --shell /bin/zsh vscode

ENV RUFF_CACHE_DIR="/home/vscode/.cache/ruff"
ENV UV_LINK_MODE="copy"
ENV UV_PROJECT_ENVIRONMENT="/home/vscode/.cache/venv"
ENV UV_SYSTEM_CERTS="true"

USER vscode
