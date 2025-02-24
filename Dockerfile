ARG TAG=1.77.3
FROM n8nio/n8n:${TAG}

USER root

RUN set -eux; \
	npm install -g --omit=dev pdf-lib@1.17.1 pdf-text-reader@5.1.0 --ignore-scripts

RUN set -eux; \
	npm install -g nanoid --ignore-scripts

USER node