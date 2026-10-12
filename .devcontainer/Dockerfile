# https://hub.docker.com/_/python/tags?name=slim-trixie
ARG PYTHON_TAG="3.14.8-slim-trixie"
ARG PYTHON_HASH="sha256:a2b82f3c48559aa0a8446d9af49826b6e2b2016f4cd2afabfe6013ec53729170"
ARG UV_TAG="0.12.24"
ARG UV_HASH="sha256:3af4716e991d6956a41e573eab705d0ee08500cd829ed30293eb8472f372c65a"

FROM astral/uv:${UV_TAG}@${UV_HASH} AS uv

FROM python:${PYTHON_TAG}@${PYTHON_HASH} as devcontainer
COPY --from=uv /uv /uvx /usr/local/bin/
ARG SNAPSHOT_DATE="20261005T000000Z"
RUN --mount=type=bind,source=install_deps.sh,target=/tmp/install_deps.sh /tmp/install_deps.sh ${SNAPSHOT_DATE}
RUN useradd --create-home --shell /bin/zsh vscode
USER vscode
