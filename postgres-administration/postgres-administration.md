# postgres-administration

NOT YET IMPLEMENTED

Exploring how to administrate Postgres via its many tools like `pg_ctl`.
  
### Overview

I'm curious to learn the basics about how to administrate Postgres. For example, how to start the server, stop it,
restart it, how to reset all the data, where the database files go on the file system. In the past, I've relied on
spinning up Postgres via a Docker container and "starting from scratch" each time. But, I'd like to know how to
administrate Postgres so that I have the option of using Postgres directly instead of via Docker (hello, [Apple Silicon](https://github.com/docker/for-mac/issues/4733)).  

### Notes

* Install Postgres on macOS using Homebrew with:
  *`brew install postgresql`
  * See the Homebrew [formula source code](https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/postgresql.rb)
* Alternatively, build Postgres from its source code
  * There is a nice macOS-specific [guide in the official Postgres docs](https://www.postgresql.org/docs/13/installation-platform-notes.html#INSTALLATION-NOTES-MACOS)
    about how to build from source.  
  * Note to self: I did build from source earlier but decided it's more idiomatic to use Homebrew to manage my Postgres
    installation
* The Homebrew formula created a data directory at `/usr/local/var/postgres`
  * What does this mean? Is this the data directory that defines a database called "postgres"? Or, is this a global thing
    that can actually be associated with multiple databases?
* Start Postgres with:
  * `pg_ctl -D /usr/local/var/postgres start`
* Log in to it with:
  * `psql postgres`
* What if I want multiple databases? How do I do that?

### Referenced Material

* [Postgres Wiki: "Administration"](https://wiki.postgresql.org/wiki/Category:Administration)
* [Postgres Wiki: "What is a cluster?](https://wiki.postgresql.org/wiki/Prioritizing_databases_by_separating_into_multiple_clusters#What.27s_a_cluster.3F)
* [Postgres docs: "Creating a database cluster"](https://www.postgresql.org/docs/13/creating-cluster.html)
