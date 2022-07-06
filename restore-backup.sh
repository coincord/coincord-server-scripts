#!/bin/sh

# Find the back file
while getopts d:c:f:db:u flag
do
    case "${flag}" in
        d) directory=${OPTARG};;
        c) container=${OPTARG};;
        f) file=${OPTARG};;
        db) database=${OPTARG};;
        u) user=${OPTARG};;
    esac
done
if [ ! -d $directory/$container/$file ]; then
  echo "FOUND BACKUPS"
  gunzip < $directory/$container/$file | docker exec -i $container psql -U $user -d $database
fi
