FROM postgres:alpine

RUN apk update && apk add --no-cache \
    curl

ARG PG_UUIDV7_VERSION=v1.5.0

RUN cd "$(mktemp -d)" \
    && curl -LO "https://github.com/fboulnois/pg_uuidv7/releases/download/$PG_UUIDV7_VERSION/{pg_uuidv7.tar.gz,SHA256SUMS}" \
    && tar xf pg_uuidv7.tar.gz \
    && sha256sum -c SHA256SUMS \
    && PG_MAJOR=$(pg_config --version | sed 's/^.* \([0-9]\{1,\}\).*$/\1/') \
    && cp "$PG_MAJOR/pg_uuidv7.so" "$(pg_config --pkglibdir)" \
    && cp pg_uuidv7--1.4.sql pg_uuidv7.control "$(pg_config --sharedir)/extension" \
    && apk del --purge curl
