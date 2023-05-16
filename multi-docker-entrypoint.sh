#!/bin/bash

function waitForConnection() {
  {
    echo "SELECT user FROM mysql.user" | mysql -h localhost -u root -p"${MARIADB_ROOT_PASSWORD}" > /dev/null 2>&1
  } || {
    sleep 1
    waitForConnection
  }
}

function initializeMultiDatabases() {
  echo "Waiting connection..."
  waitForConnection || exit 1
  echo "Connection established!"

  echo "Initializing multi databases..."

  for ((i = 1; ; i++)); do
    db_name="$(eval echo "\$MARIADB_${i}_NAME")"
    db_user="$(eval echo "\$MARIADB_${i}_USER")"
    db_pwd="$(eval echo "\$MARIADB_${i}_PASSWORD")"

    if [ "${db_name}" = '' ] || [ "${db_user}" = '' ]; then
      break
    fi

    echo "CREATE DATABASE IF NOT EXISTS ${db_name};" | mysql -h localhost -u root -p"${MARIADB_ROOT_PASSWORD}"
    echo "CREATE USER IF NOT EXISTS '${db_user}' IDENTIFIED BY '${db_pwd}';" | mysql -h localhost -u root -p"${MARIADB_ROOT_PASSWORD}"
    echo "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}';" | mysql -h localhost -u root -p"${MARIADB_ROOT_PASSWORD}"

    echo "Database ${db_name} initialized!"
  done

  echo "Multi databases initialized!"
}

initializeMultiDatabases &
docker-entrypoint.sh "$@"
