ARG BASE_IMAGE="python"
ARG BASE_TAG="3.14.6-slim-trixie"
ARG BASE_HASH="sha256:cea0e6040540fb2b965b6e7fb5ffa00871e632eef63719f0ea54bca189ce14a6"

FROM ${BASE_IMAGE}:${BASE_TAG}@${BASE_HASH} AS base
ARG SNAPSHOT_DATE="20260715T000000Z"
RUN --mount=type=bind,source=install_deps.sh,target=/tmp/install_deps.sh /tmp/install_deps.sh ${SNAPSHOT_DATE}

FROM base AS devcontainer
RUN useradd --create-home --shell /bin/zsh vscode
USER vscode
