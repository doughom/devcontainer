# https://hub.docker.com/_/python/tags?name=slim-trixie
ARG BASE_TAG="3.14.8-slim-trixie"
ARG BASE_HASH="sha256:a2b82f3c48559aa0a8446d9af49826b6e2b2016f4cd2afabfe6013ec53729170"

FROM python:${BASE_TAG}@${BASE_HASH} AS base
ARG SNAPSHOT_DATE="20261005T000000Z"
RUN --mount=type=bind,source=install_deps.sh,target=/tmp/install_deps.sh /tmp/install_deps.sh ${SNAPSHOT_DATE}

FROM base AS devcontainer
RUN useradd --create-home --shell /bin/zsh vscode
USER vscode
