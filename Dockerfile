FROM node:24.16.0-bookworm-slim

RUN sed -i 's/Components: main/Components: main contrib/g' /etc/apt/sources.list.d/debian.sources && \
    apt update && \
    apt install -y \
                    curl \
                    fd-find \
                    gh \
                    git \
                    git-lfs \
                    jq \
                    less \
                    procps \
                    python3 \
                    python3-pip \
                    ripgrep \
                    && \
    curl -fsSLo /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.53.2/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq && \
    apt install -y --no-install-recommends \
        fonts-dejavu-core \
        fonts-dejavu-extra \
        fonts-freefont-ttf \
        fonts-ipafont-gothic \
        fonts-kacst \
        fonts-noto-cjk \
        fonts-noto-cjk-extra \
        fonts-thai-tlwg \
        fonts-wqy-microhei \
        fonts-wqy-zenhei \
        ttf-mscorefonts-installer \
        && \
    fc-cache -f -v && \
    npm i -g cabinetai@0.4.4 && \
    npm i -g opencode-ai && \
# cleanup
    apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists/* /tmp/*

USER node
