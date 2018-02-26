#!/usr/bin/env sh
set -ex
FILENAME=$(date +%Y-%m-%d_%H-%M-%S)_${DATABASE}.sql.gz
mysqldump --host="${HOST:-localhost}" --user="${USER}" --password="${PASSWORD}" --port="${PORT:-3306}" "${DATABASE}" \
    | pv --progress --timer --force \
    | gzip -c \
    > $FILENAME
ls -lah *.gz
s3cmd put --config=${S3CFG_PATH} --verbose --progress $FILENAME s3://${BUCKET}/${S3_DIR}/
