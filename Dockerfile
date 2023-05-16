FROM mariadb:10

MAINTAINER fabrizio@fubelli.org

COPY multi-docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["multi-docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mariadbd"]
