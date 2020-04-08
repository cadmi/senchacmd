FROM openjdk:8-jre
LABEL maintainer "Dmitry Ishutkin <cadmi@cadmi.ru>"

ENV VERSION=7.2.0.56

# http://cdn.sencha.com/cmd/$VERSION/no-jre/SenchaCmd-$VERSION-linux-amd64.sh.zip && \

RUN curl -o /cmd.run.zip http://cdn.sencha.com/cmd/$VERSION/no-jre/SenchaCmd-$VERSION-linux-amd64.sh.zip && \
    unzip -p /cmd.run.zip > /cmd-install.run && \
    chmod +x /cmd-install.run && \
    /cmd-install.run -q -Dall=true -dir /opt/Sencha/Cmd/$VERSION && \
    install -dm777 -o root -g root /opt/Sencha/Cmd/repo && \
    rm /cmd-install.run /cmd.run.zip && \
    ln -s /opt/Sencha/Cmd/$VERSION/sencha /opt/Sencha/sencha && \
    curl -fsSL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get update && apt-get install -y --no-install-recommends \
        ruby \
        libffi6 \
        build-essential \
        ruby-dev \
        libffi-dev \
        nodejs && \
    gem update --system && \
    gem install compass && \
    apt-get remove -y ruby-dev build-essential libffi-dev && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* 

ENTRYPOINT ["/opt/Sencha/sencha"]
