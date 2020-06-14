FROM    debian:buster-slim
ARG     MEILISEARCH_VERSION
RUN     apk add -q --no-cache libgcc tini
RUN     wget -O ./meilisearch https://github.com/meilisearch/MeiliSearch/releases/download/${MEILISEARCH_VERSION}/meilisearch-linux-armv8 \
        && chmod 744 ./meilisearch
ENV     MEILI_HTTP_ADDR 0.0.0.0:7700
EXPOSE  7700/tcp

ENTRYPOINT ["tini", "--"]
CMD     ./meilisearch