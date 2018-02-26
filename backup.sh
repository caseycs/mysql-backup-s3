#!/usr/bin/env sh
set -ex

[[ -z "$HOST" ]] && { echo "HOST is empty" ; exit 1; }
[[ -z "$USER" ]] && { echo "USER is empty" ; exit 1; }

FILENAME=$(date +%Y-%m-%d_%H-%M-%S)_${DATABASE}.sql.gz

mysqldump --host="${HOST}" --user="${USER}" --password="${PASSWORD}" --port="${PORT:-3306}" "${DATABASE}" \
    | pv --progress --timer --force \
    | gzip -c \
    > $FILENAME

ls -lah *.gz

s3cmd put --verbose --progress $FILENAME s3://${S3_BUCKET}/${S3_DIR}/
