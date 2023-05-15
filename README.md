# MariaDB

Official Docker MariaDB Image of [Synaps.is](https://synaps.is)

## Docker Image content

- [MariaDB](https://mariadb.org/)

## Dockerfile Example

```dockerfile
FROM syis/mariadb:latest

# An initialization script creates the needed
# databases by reading the environments named:
# - MARIADB_x_NAME
# - MARIADB_x_USER
# - MARIADB_x_PASSWORD
# (where x is an incremental integer)
# The script cycle over the numbers (by starting from 1),
# until it NOT find a variable named MARIADB_i_NAME

ENV MARIADB_1_NAME='db_name'
ENV MARIADB_1_USER='db_user'
ENV MARIADB_1_PASSWORD='db_password'

ENV MARIADB_2_NAME='db_2_name'
ENV MARIADB_2_USER='db_2_user'
ENV MARIADB_2_PASSWORD='db_2_password'
```

## Links

- [Docker Hub](https://hub.docker.com/r/syis/mariadb)

## Tags

- [10](https://github.com/synapsis-official/docker_mariadb/tree/10)
