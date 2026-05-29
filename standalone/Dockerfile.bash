# syntax=docker/dockerfile:1.7

FROM alpine:3.20
SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]
RUN for item in todo doing done; do echo "status=${item}"; done
