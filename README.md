# Isso - Docker ARM builds for Raspberry PI
[![Docker Stars](https://img.shields.io/docker/stars/gilir/rpi-isso.svg?maxAge=2592000)](https://hub.docker.com/r/gilir/rpi-isso/)
[![Docker Pulls](https://img.shields.io/docker/pulls/gilir/rpi-isso.svg?maxAge=2592000)](https://hub.docker.com/r/gilir/rpi-isso/)
[![Docker Image](https://images.microbadger.com/badges/image/gilir/rpi-isso.svg)](https://microbadger.com/images/gilir/rpi-isso "Get your own image badge on microbadger.com")
[![Version](https://images.microbadger.com/badges/version/gilir/rpi-isso.svg)](https://microbadger.com/images/gilir/rpi-isso "Get your own version badge on microbadger.com")


## About Isso
[Isso](https://posativ.org/isso/) is a commenting server similar to Disqus.

## ARM build, for Raspberry PI
Based on official alpine version of Dockerbuild. See Tags for the versions of Isso available.

## Features
- Alpine 3.6

## How to use

To run this image
```
docker run --name some-isso -p 8080:8080 -d isso
```

Or you can use a docker-compose:
```
version: '2'

services:
  isso:
    image: gilir/rpi-isso
    container_name: isso
    ports:
      - "8080:8080"
```
And run it with:
```
docker-compose up -d
```

# Sources
- Gogs: https://gogs.lavergne.online/gilir/rpi-isso.git
- Github: https://github.com/gilir/rpi-isso
