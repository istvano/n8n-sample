ARG TAG=1.86.0
FROM n8nio/n8n:${TAG}

USER root

# this is needed for zerox
RUN apk add --no-cache file graphicsmagick ghostscript
#RUN apk add --no-cache file libreoffice poppler-utils

RUN set -eux; \
	npm install -g --omit=dev pdf-lib@1.17.1 pdf-text-reader@5.1.0 --ignore-scripts

RUN set -eux; \
	npm install -g --omit=dev nanoid --ignore-scripts

# RUN set -eux; \
# 	npm install -g --omit=dev zerox

USER node