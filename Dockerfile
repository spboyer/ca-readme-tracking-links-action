FROM alpine:3.10

RUN apk update \
    && apk add curl jq

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]