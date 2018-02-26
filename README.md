# mysql-backup-s3

Docker container to backup mysql database to S3 via [s3cmd](https://github.com/s3tools/s3cmd)

## Motivation

While running mysql in containers backups, one of the options is to use separate staeless container for making backups and run it via cron or even jenkins.

## Usage example

```
docker run --rm \
  -e AWS_ACCESS_KEY=xxx \
  -e AWS_SECRET_KEY=xxx \
  -e HOST=host \
  -e USER=user \
  -e PASSWORD=password\
  -e DATABASE=database \
  -e S3_BUCKET=backups \
  -e S3_DIR=mysql-database \
  caseycs/mysql-backup-s3
```
