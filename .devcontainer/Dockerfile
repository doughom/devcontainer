FROM debian:trixie-slim@sha256:4ffb3a1511099754cddc70eb1b12e50ffdb67619aa0ab6c13fcd800a78ef7c7a

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
