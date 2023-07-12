FROM eclipse-temurin:8-jre

LABEL maintainer "Dmitry Ishutkin <cadmi@cadmi.ru>"
LABEL org.opencontainers.image.source=https://github.com/cadmi/senchacmd
LABEL org.opencontainers.image.description="Docker image with Sencha Cmd"

ENV VERSION=7.7.0.36
ENV PATH=/opt/Sencha/Cmd/${VERSION}:${PATH}
ENV OPENSSL_CONF=/dev/null

RUN apt-get update --yes && apt-get install --yes --no-install-recommends unzip \
    && wget --no-check-certificate http://cdn.sencha.com/cmd/${VERSION}/no-jre/SenchaCmd-${VERSION}-linux-amd64.sh.zip \
    && unzip SenchaCmd-${VERSION}-linux-amd64.sh.zip -d /tmp \
    && unlink SenchaCmd-${VERSION}-linux-amd64.sh.zip \
    && chmod +x /tmp/SenchaCmd-${VERSION}-linux-amd64.sh \
    && /tmp/SenchaCmd-${VERSION}-linux-amd64.sh -q -Dall=true -dir /opt/Sencha/Cmd/${VERSION} \
    && unlink /tmp/SenchaCmd-${VERSION}-linux-amd64.sh \
    && install -dm777 -o root -g root /opt/Sencha/Cmd/repo \
    && ln -s /opt/Sencha/Cmd/${VERSION}/sencha /opt/Sencha/sencha \
    && apt-get purge --yes unzip \
    && apt-get autoremove --purge --yes \
    && apt-get clean --yes \
    && rm -rf /var/lib/apt/lists/*

CMD ["/opt/Sencha/Cmd/sencha"]
