# syntax=docker/dockerfile:1.7

ARG NGINX_IMAGE=nginxinc/nginx-unprivileged:1.27-alpine

FROM ${NGINX_IMAGE}

LABEL org.opencontainers.image.title="basic-files" \
      org.opencontainers.image.description="Small unprivileged static file container for this repository's exported files"

USER root
RUN rm -rf /usr/share/nginx/html/*

COPY --chown=101:101 example.sqlite3 /usr/share/nginx/html/
COPY --chown=101:101 rollout-*.jsonl /usr/share/nginx/html/

USER 101
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:8080/ || exit 1
