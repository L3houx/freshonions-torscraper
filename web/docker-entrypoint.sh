#!/bin/sh

# This section comes from CTFd project and is licensed under Apache v2
# https://github.com/CTFd/CTFd/blob/master/docker-entrypoint.sh
# Check that the database is available
if [ -n "$DATABASE_URL" ]
    then
    database=`echo $DATABASE_URL | awk -F[@//] '{print $4}'`
    echo "Waiting for $database to be ready"
    while ! mysqladmin ping -h $database --silent; do
        # Show some progress
        echo -n '.';
        sleep 1;
    done
    echo "$database is ready"
    # Give it another second.
    sleep 1;
fi
# end of Apache v2 licensed CTFd section

/opt/torscraper/scripts/web.sh
