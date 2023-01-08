# sql-playground

📚 Learning and exploring SQL (Postgres in particular).

---

## Standalone sub-projects

This repository illustrates different concepts, patterns and examples via standalone sub-projects. Each sub-project is
completely independent of the others and do not depend on the root project. This _standalone sub-project constraint_
forces the sub-projects to be complete and maximizes the reader's chances of successfully running, understanding, and
re-using the code.

The sub-projects include:

### `arrays/`

Showcasing the `array` SQL data type.

See the README in [arrays/](arrays/).


### `lag/`

Showcasing the `lag` Postgres function which is a part of Postgres' windowing support.

See the README in [lag/](lag/).


### `docker/`

Run Postgres in a Docker container using Docker Compose.

See the README in [docker/](docker/).


### `administration/`

Exploring how to administrate Postgres via its many tools like `pg_ctl`.

See the README in [administration/](administration/).


### `test-data/`

Generate test data to aid in performance exploration and analysis.

See the README in [test-data/](test-data/).


## WishList

General clean-ups, TODOs and things I wish to implement for this project:

* DONE Explore Postgres without Docker. I'd like to learn the basics of `pg_ctl` so I don't need to depend on Docker to run
  Postgres (although Docker is super convenient!) 
