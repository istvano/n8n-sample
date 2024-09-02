FROM n8nio/n8n:1.57.0

USER root

RUN set -eux; \
	npm install -g --omit=dev pdf-lib@1.17.1 pdf-text-reader@5.1.0 --ignore-scripts

USER node
