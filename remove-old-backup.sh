#!/bin/sh

# Find the back file
while getopts d:c flag
do
    case "${flag}" in
        d) directory=${OPTARG};;
        c) container=${OPTARG};;
    esac
done

if [ ! -d $directory/$container]; then
  echo "FOUND BACKUPS"
  rm -f  $directory/$container/dump_$(date +%Y%m%d* --date='1 week ago')_database.gz
fi
