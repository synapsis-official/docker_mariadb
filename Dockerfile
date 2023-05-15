FROM mariadb:10

MAINTAINER fabrizio@fubelli.org

COPY init.sh /docker-entrypoint-initdb.d/init.sh
