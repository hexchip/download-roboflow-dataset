ARG BASE_IMAGE=python:3.12-slim

FROM $BASE_IMAGE

RUN pip install --no-cache-dir roboflow

WORKDIR /datasets

COPY --chmod=754 docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]