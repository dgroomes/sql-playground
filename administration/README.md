# administration

Exploring how to administrate Postgres via its many tools like `pg_ctl`.
  

## Overview

I'm curious to learn the basics about how to administrate Postgres. For example, how to start the server, stop it,
restart it, how to reset all the data, where the database files go on the file system. In the past, I've relied on
spinning up Postgres via a Docker container and "starting from scratch" each time. But, I'd like to know how to
administrate Postgres so that I have the option of using Postgres directly instead of via Docker (hello, [Apple Silicon](https://github.com/docker/for-mac/issues/4733)).  


## Notes

* Install Postgres on macOS using Homebrew with:
  * ```shell
    brew install postgresql@16
    ```
  * See the Homebrew [formula source code](https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/postgresql.rb)
* Alternatively, build Postgres from its source code
  * There is a nice macOS-specific [guide in the official Postgres docs](https://www.postgresql.org/docs/13/installation-platform-notes.html#INSTALLATION-NOTES-MACOS)
    about how to build from source.  
  * Note to self: I did build from source earlier but decided it's more idiomatic to use Homebrew to manage my Postgres
    installation
* The Homebrew formula created a data directory somewhere.
  * HomeBrew created the data directory at `/opt/homebrew/var/postgresql@16`.
  * What does this mean? Is this the data directory that defines a database called "postgres"? Or, is this a global thing
    that can actually be associated with multiple databases?
* Start Postgres with:
  * ```shell
    pg_ctl -D /opt/homebrew/var/postgresql@16 start
    ```
* Log in to it with:
  * ```shell
    psql postgres
    ```
* When you're finished, stop the database.
  * ```shell
    pg_ctl -D /opt/homebrew/var/postgresql@16 stop
    ```
* What if I want multiple databases? How do I do that?
* I've captured some snippets to start, stop and recreate a Postgres instance over in my [`my-config` repository](https://github.com/dgroomes/my-config/blob/bd59be9748936c1978ade51b43e3188cd582714b/bash/bash-functions.sh#L66).


## Reference

* [Postgres Wiki: "Administration"](https://wiki.postgresql.org/wiki/Category:Administration)
* [Postgres Wiki: "What is a cluster?](https://wiki.postgresql.org/wiki/Prioritizing_databases_by_separating_into_multiple_clusters#What.27s_a_cluster.3F)
* [Postgres docs: "Creating a database cluster"](https://www.postgresql.org/docs/13/creating-cluster.html)
* [dgroomes/my-config: "My configuration files and macOS setup instructions"](https://github.com/dgroomes/my-config/blob/bd59be9748936c1978ade51b43e3188cd582714b/bash/bash-functions.sh#L66)
