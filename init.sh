#!/bin/bash

for (( i=1; ; i++ )); do
  db_name="$(eval echo "\$MARIADB_${i}_NAME")"
  db_user="$(eval echo "\$MARIADB_${i}_USER")"
  db_pwd="$(eval echo "\$MARIADB_${i}_PASSWORD")"

  if [ "${db_name}" = '' ] || [ "${db_user}" = '' ]; then
    break
  fi

  echo "CREATE DATABASE ${db_name};" | mysql -h localhost -u root -p"${MYSQL_ROOT_PASSWORD}"
  echo "CREATE USER '${db_user}' IDENTIFIED BY '${db_pwd}';" | mysql -h localhost -u root -p"${MYSQL_ROOT_PASSWORD}"
  echo "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}';" | mysql -h localhost -u root -p"${MYSQL_ROOT_PASSWORD}"
done
