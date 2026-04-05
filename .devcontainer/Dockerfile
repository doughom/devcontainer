# trixie-20260316-slim
FROM debian@sha256:26f98ccd92fd0a44d6928ce8ff8f4921b4d2f535bfa07555ee5d18f61429cf0c

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
