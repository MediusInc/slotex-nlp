#!/bin/bash 
###################################################################
#Script Name   : 00-fill-env-vars.sh
#Description   :
#Args          :
#Author        : Tadej Justin
#Email         : tadej.justin@medius.si
###################################################################

for f in $(find /docker-entrypoint-initdb.d -name "*.in"); do 
    b=$(basename "$f" ".in")
    cp "$f" /docker-entrypoint-initdb.d/"$b".1
    < /docker-entrypoint-initdb.d/"$b".1 sed "s~__MONGO_INITDB_DATABASE__~${MONGO_INITDB_DATABASE}~g" > /docker-entrypoint-initdb.d/"$b".2 
    < /docker-entrypoint-initdb.d/"$b".2 sed "s~__MONGO_INITDB_ROOT_PASSWORD__~${MONGO_INITDB_ROOT_PASSWORD}~g" > /docker-entrypoint-initdb.d/"$b".3
    < /docker-entrypoint-initdb.d/"$b".3 sed "s~__MONGO_INITDB_ROOT_USERNAME__~${MONGO_INITDB_ROOT_USERNAME}~g" > /docker-entrypoint-initdb.d/"$b".4 
    < /docker-entrypoint-initdb.d/"$b".4 sed "s~__MONGO_DATABASE__~${MONGO_DATABASE}~g" > /docker-entrypoint-initdb.d/"$b".5
    < /docker-entrypoint-initdb.d/"$b".5 sed "s~__MONGO_USERNAME__~${MONGO_USERNAME}~g" > /docker-entrypoint-initdb.d/"$b".6
    < /docker-entrypoint-initdb.d/"$b".6 sed "s~__MONGO_PASSWORD__~${MONGO_PASSWORD}~g" > /docker-entrypoint-initdb.d/"$b"
done

rm /docker-entrypoint-initdb.d/"$b".{1..6}

exit 0
