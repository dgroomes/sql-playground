# docker

Run Postgres in a Docker container using Docker Compose.

## Instructions

1. Start a Postgres instance using Docker Compose:
    * `docker-compose up --detach`
1. Explore the database! Enter a session on the command line:
    * `psql --username postgres --host localhost`
1. Stop the Postgres Docker container:
    * `docker-compose down`

## Referenced Material

* [Docker Compose](https://docs.docker.com/compose/)
