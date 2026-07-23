ARG BASE_IMAGE="python"
ARG BASE_TAG="3.14.6-slim-trixie"
ARG BASE_HASH="sha256:cea0e6040540fb2b965b6e7fb5ffa00871e632eef63719f0ea54bca189ce14a6"



FROM ${BASE_IMAGE}:${BASE_TAG}@${BASE_HASH} AS base
ARG SNAPSHOT_DATE="20260715T000000Z"
RUN --mount=type=bind,source=install_base_deps.sh,target=/tmp/install_base_deps.sh /tmp/install_base_deps.sh ${SNAPSHOT_DATE}



FROM base AS devcontainer
RUN useradd --create-home --shell /bin/zsh vscode
USER vscode



FROM buildpack-deps:trixie-curl@sha256:ef554489e8f8b0245ef3cb2742b4c6b6e53c43bd64366b13f624982c854af2eb AS pi-builder
# https://github.com/earendil-works/pi/releases
ARG PI_VERSION=v0.80.3
ARG PI_X64_HASH=e74a34ac2505556164144d8e39a64d6d5276f092166dad914319edc30c48abee
ARG PI_ARM64_HASH=c544ab2a0953a9bda358cab9bc328b1ef6892d4a824d8693880977e4b23c6168
RUN --mount=type=bind,source=download_pi.sh,target=/tmp/download_pi.sh /tmp/download_pi.sh ${PI_VERSION} ${PI_X64_HASH} ${PI_ARM64_HASH}



FROM base AS pi
ARG SNAPSHOT_DATE="20260715T000000Z"
RUN --mount=type=bind,source=install_pi.sh,target=/tmp/install_pi.sh /tmp/install_pi.sh ${SNAPSHOT_DATE}
COPY --from=pi-builder /pi-agent/ /usr/local/bin/
USER agent
CMD ["pi"]
