# https://hub.docker.com/r/astral/uv/tags
FROM astral/uv:0.13.5@sha256:32a7bb39b496babbd997b0a39a4d66c126bdaf5661b302bf6f06abda8deca6ff AS uv
# https://hub.docker.com/_/python/tags?name=slim-trixie
FROM python:3.15.0-slim-trixie@sha256:f5b92f2a669a4c347044f29367f31983280b648250ca94dea66f98c53bc87e58 as devcontainer
COPY --from=uv /uv /uvx /usr/local/bin/

ENV APT_SNAPSHOT_DATE="20261023T000000Z"
RUN --mount=type=bind,source=install_deps.sh,target=/tmp/install_deps.sh /tmp/install_deps.sh ${APT_SNAPSHOT_DATE}
RUN useradd --create-home --shell /bin/zsh vscode

ENV UV_LINK_MODE="copy"
ENV UV_PROJECT_ENVIRONMENT="/home/vscode/.cache/venv"
ENV UV_SYSTEM_CERTS="true"

USER vscode
