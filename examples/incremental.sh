#!/bin/sh

DIR_BACKUP=/var/backups
DB_NAME=mydatabasename
DB_USER=user_with_access
DB_PASS=Replace_with_password_of user_with_access
DB_HOST=yourhost.de_or_ipadress

DOW=`date "+%a"`
DB_DUMP=$DIR_BACKUP/dbdump.incremental.$DB_NAME.$DOW

mydumper \
  --database=$DB_NAME \
  --host=$DB_HOST \
  --user=$DB_USER \
  --password=$DB_PASS \
  --outputdir=$DB_DUMP \
  --compress \
  --build-empty-files \
  --threads=8 \
  --compress-protocol \
  --daemon \
  --snapshot-interval=60 \
  --no-locks