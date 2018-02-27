# mysql-backup-s3

Docker container to backup mysql database to S3 via [s3cmd](https://github.com/s3tools/s3cmd)

## Motivation

While running mysql in containers backups, one of the options is to use separate stateless container for making backups and uploading them to the cloud.
 
You can run it via crontab or even jenkins (with `build periodically`).

## Usage example

```
docker run --rm \
  -e AWS_ACCESS_KEY=xxx \
  -e AWS_SECRET_KEY=xxx \
  -e HOST=host \
  -e USER=user \
  -e PASSWORD=password\
  -e DATABASE=database \
  -e S3_PATH=bucket/directory \
  caseycs/mysql-backup-s3
```

## Hits

Use can specify `xz` compression parameters via `XZ_OPTIONS`: `-e XZ_OPTIONS="-vv -T0 -1"`
