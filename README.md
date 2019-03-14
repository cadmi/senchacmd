# Sencha cmd image

This is a tool image for the Sencha cmd, based on official openjdk:8-jre image. `npm` ans `compass` is also included as part of sencha build process.

See https://www.sencha.com/products/sencha-cmd/

# Docker hub

See https://hub.docker.com/r/cadmi/senchacmd/.

# Usage

```
  docker run --rm -v $(pwd):/code --workdir /code cadmi/senchacmd app build
```
