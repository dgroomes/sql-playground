# snapshots

Showcasing the `lag` Postgres function which is a part of Postgres' windowing support. Specifically, I wanted to
illustrate a query where each row needs to be compared to the row preceding it.

### Instructions

```
psql --username postgres --host localhost -f snapshots/snapshots-schema.ddl 
psql --username postgres --host localhost -f snapshots/snapshots-data.sql
```

### Referenced Material

* [Postgres official docs: "Window Functions" tutorial](https://www.postgresql.org/docs/13/tutorial-window.html)
* [Postgres official docs: "Window Functions" reference](https://www.postgresql.org/docs/13/functions-window.html)