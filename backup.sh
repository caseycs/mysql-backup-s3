#!/usr/bin/env sh
set -ex

[[ -z "$HOST" ]] && { echo "HOST is empty" ; exit 1; }
[[ -z "$USER" ]] && { echo "USER is empty" ; exit 1; }

FILENAME=$(date +%Y-%m-%d_%H-%M-%S)_${DATABASE}.sql.xz

mysqldump --host="${HOST}" --user="${USER}" --password="${PASSWORD}" --port="${PORT:-3306}" "${DATABASE}" \
    | pv --progress --timer --force --interval 5 --null \
    | xz ${XZ_OPTIONS} \
    > $FILENAME

ls -lah *.xz

s3cmd ${S3CMD_OPTIONS} --verbose --progress put $FILENAME s3://${S3_PATH}/
