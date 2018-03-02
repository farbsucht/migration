#!/bin/sh

# Duration: 60min

# Instructions: place farbsucht.sql.gz into backups/ and it will restore the backup automatically,
# the mysql data will saved in mysql_datadir

docker container stop farbsucht-mysql-restore
docker container rm farbsucht-mysql-restore
docker volume rm backups
docker volume rm mysql_datadir
rm -r ./mysql_datadir/*

docker run --name farbsucht-mysql-restore -v $(pwd)/mysql_datadir:/var/lib/mysql -v $(pwd)/backups:/docker-entrypoint-initdb.d -e MYSQL_DATABASE=farbsucht -e MYSQL_ROOT_PASSWORD=farbsucht2018 mysql:5.7
