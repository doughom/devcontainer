# https://hub.docker.com/_/python/tags?name=slim-trixie
ARG PYTHON_TAG="3.14.9-slim-trixie"
ARG PYTHON_HASH="sha256:b347e2dcbc7f0b6f9fb7182e9da6a187fb10ae715e0692518c1aed0eec94a700"
ARG UV_TAG="0.13.5"
ARG UV_HASH="sha256:32a7bb39b496babbd997b0a39a4d66c126bdaf5661b302bf6f06abda8deca6ff"

FROM astral/uv:${UV_TAG}@${UV_HASH} AS uv

FROM python:${PYTHON_TAG}@${PYTHON_HASH} as devcontainer
COPY --from=uv /uv /uvx /usr/local/bin/
ARG SNAPSHOT_DATE="20261022T000000Z"
RUN --mount=type=bind,source=install_deps.sh,target=/tmp/install_deps.sh /tmp/install_deps.sh ${SNAPSHOT_DATE}
RUN useradd --create-home --shell /bin/zsh vscode
USER vscode
