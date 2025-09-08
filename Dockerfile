ARG TAG=1.109.2
FROM n8nio/n8n:${TAG}

USER root

RUN set -eux; \
	npm install -g --omit=dev nanoid --ignore-scripts

USER node