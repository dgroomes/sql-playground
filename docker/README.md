# docker

Run Postgres in a Docker container using Docker Compose.

## Overview

While it's  pretty easy to install, start, stop, and upgrade Postgres on your Mac using Homebrew, it takes even fewer
steps to run it in a Docker container. In your own development workflow you might even prefer to run Postgres in Docker
because you likely want to destroy and recreate your database state over and over again during your development and
testing cycle. If you are already using Docker to run other services, it's a small incremental cost to also run
Postgres in a container. On the other hand, if you don't want to pay for the expensive cost of virtualization (CPU,
memory and disk access times), consider running Postgres on your Mac natively.

This project provides a prototypical Docker Compose configuration for running Postgres in a Docker container. Of note
is the use of a Docker bind mount on the local `postgres-init/` directory into the container at `/docker-entrypoint-initdb.d/`.
The Postgres Docker container contains some special logic to execute any `.sql` files in that directory when the database
starts up. This is a convenient way to initialize the database with a schema and/or data.


## Instructions

Follow these instructions to get up and running with Postgres in a Docker container.

1. Pre-requisites: Docker
    * I'm using Docker Desktop, but you could use an alternative, like [Colima](https://github.com/abiosoft/colima).
2. Start a Postgres instance using Docker Compose:
    * ```shell
      docker compose up
      ```
    * Note: you'll usually want to use the `--detach` option so that the container runs in the background. For this
      example, we want to take a moment and actually inspect the output of the container startup. What do you notice?
3. Explore the database! Enter a session on the command line:
    * ```shell
      docker exec --interactive --tty docker-postgres-1 psql --username postgres --host localhost
      ```
    * Try something like `select 1 + 2;` or `select region, count(*) from destinations group by region order by region;`.
    * When you are finished, exit the session with `\q`.
4. Stop the Postgres Docker container:
    * ```shell
      docker compose down
      ```


## Reference

* [Docker Compose](https://docs.docker.com/compose/)
