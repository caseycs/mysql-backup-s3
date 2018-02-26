# mysql-backup-s3

Docker container to backup mysql database to S3

```
docker run --rm \
  -v $S3CFG_PATH:/.s3cfg \
  -e HOST=host \
  -e USER=user \
  -e PASSWORD=password\
  -e DATABASE=database \
  -e S3_BUCKET=backups \
  -e S3_DIR=mysql-database \
  caseycs/mysql-backup-s3
```
