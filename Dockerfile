FROM alpine:latest

RUN set -ex \
    && apk add --no-cache mysql-client pv py-pip xz expect \
    && pip install s3cmd

ADD backup.sh /

CMD ["/backup.sh"]
