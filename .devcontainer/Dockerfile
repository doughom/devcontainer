# https://hub.docker.com/r/astral/uv/tags
FROM astral/uv:0.13.8@sha256:5cc1805e2426484abca4ad46ea783bab281fdb225fd82d8ce6d66a81254bac85 AS uv
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
