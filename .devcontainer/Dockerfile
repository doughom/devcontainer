# trixie-20260316-slim
FROM debian@sha256:55a15a112b42be10bfc8092fcc40b6748dc236f7ef46a358d9392b339e9d60e8

RUN apt-get update && apt-get install --yes --no-install-recommends \
    bash-completion \
    ca-certificates \
    git \
    locales

RUN sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
COPY bashrc /etc/bash.bashrc.custom

RUN useradd --create-home --shell /bin/bash vscode
USER vscode

RUN cat /etc/bash.bashrc.custom | tee -a /home/vscode/.bashrc
