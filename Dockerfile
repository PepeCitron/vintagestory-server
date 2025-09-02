FROM mcr.microsoft.com/dotnet/runtime:8.0

# Env var
ENV SERVER_BRANCH="stable" \
    SERVER_VERSION="1.21.0" \
    SERVER_PORT="42420" \
    WORLDCONFIG_PROPICK_NODE_SEARCH_RADIUS="6" \
    UID="1000" \
    GID="1000"

# Install dependencies
RUN apt-get update && \
    apt-get install --no-install-recommends -y wget netcat jq moreutils && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /data && mkdir /data/server-file && \
    touch /data/server-file/.version

# Add User
RUN useradd -u $UID -U -m -s /bin/false vintagestory && usermod -G users vintagestory && \
    chown -R vintagestory:vintagestory /data

# Expose ports
EXPOSE 42420

# Healthcheck
HEALTHCHECK --start-period=1m --interval=5s CMD nc -z  127.0.0.1 $SERVER_PORT

VOLUME ["/data/server-file"]

COPY serverconfig.json /data/default-serverconfig.json

COPY entry.sh /data/scripts/entry.sh
CMD ["bash", "/data/scripts/entry.sh"]
