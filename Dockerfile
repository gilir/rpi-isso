FROM arm32v6/alpine:3.6

# Upgrating the image first, to have the last version of all packages, and to
# share the same layer accros the images
RUN apk --no-cache upgrade \
    && apk --no-cache add \
       su-exec \
       ca-certificates

ARG ISSO_VERSION=0.10.6

ENV GID=1000 UID=1000

COPY run.sh /usr/local/bin/run.sh

RUN apk --no-cache add --virtual build-dependencies \
    python-dev \
    libffi-dev \
    py2-pip \
    build-base \
 && apk --no-cache add \
    ${BUILD_DEPS} \
    python \
    py-setuptools \
    sqlite \
    libressl \
    ca-certificates \
    su-exec \
    tini \
 && pip install --no-cache cffi \
 && pip install --no-cache misaka==1.0.2 \
 && pip install --no-cache "isso==${ISSO_VERSION}" \
 && apk del build-dependencies \
 && rm -rf /var/cache/apk/* /tmp/* \
 && chmod +x /usr/local/bin/run.sh

EXPOSE 8080

VOLUME /db /config

LABEL description="A commenting server similar to Disqus" \
      maintainer="Julien Lavergne <julien@lavergne.online>" \
      isso_version="${ISSO_VERSION}" \
      original_maintainer_url="https://github.com/Wonderfall/dockerfiles/tree/master/isso" \
      original_maintainer="Wonderfall <wonderfall@targaryen.house>" \
      project_url="https://posativ.org/isso/" \
      alpine_version="3.6" \
      architecture="arm32v6"

CMD ["run.sh"]
