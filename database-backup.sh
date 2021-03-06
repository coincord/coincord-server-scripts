#!/bin/bash

while getopts d:c:f:db:u flag
do
    case "${flag}" in
        d) directory=${OPTARG};;
        c) container=${OPTARG};;
        f) file=${OPTARG};;
        db) database=${OPTARG};;
        u) user=-${OPTARG};;
    esac
done

if [ ! -d $directory/$container ]; then
  mkdir -p $directory/$container ;
fi
NOW=$(date +%Y%m%d%H%M%S)
SQL_BACKUP=${NOW}_database

docker exec -t $container pg_dumpall -c -U $user | gzip > $directory/$container/dump_$SQL_BACKUP.gz