ARG TAG=1.123.43

FROM n8nio/runners:${TAG}

USER root

RUN set -eux; \
    cd /opt/runners/task-runner-javascript; \
    pnpm add nanoid@3

# The launcher (Go binary) reads /etc/n8n-task-runners.json and uses `env-overrides`
# to force NODE_FUNCTION_ALLOW_BUILTIN/EXTERNAL on the spawned runner, ignoring
# whatever is set in the container env. Patch those defaults so Code nodes can
# require the modules we install above.
RUN set -eux; \
    sed -i \
      -e 's/"NODE_FUNCTION_ALLOW_BUILTIN": *"[^"]*"/"NODE_FUNCTION_ALLOW_BUILTIN": "*"/' \
      -e 's/"NODE_FUNCTION_ALLOW_EXTERNAL": *"[^"]*"/"NODE_FUNCTION_ALLOW_EXTERNAL": "axios,moment,uuid,nanoid"/' \
      /etc/n8n-task-runners.json; \
    grep NODE_FUNCTION /etc/n8n-task-runners.json

USER runner