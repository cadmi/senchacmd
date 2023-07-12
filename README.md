# Sencha Cmd image

This is a tool image for the Sencha Cmd, based on official openjdk:8-jre-slim image.

See https://www.sencha.com/products/sencha-cmd/

# Docker hub

See https://hub.docker.com/r/cadmi/senchacmd/.

# Usage

```
  docker run --rm -v $(pwd):/code --workdir /code cadmi/senchacmd sencha app build
```
