# snapshots

NOT YET IMPLEMENTED

* Schema file: `snapshots-schema.ddl`
* Data file: `snaphshots-data.sql`

I'm trying to learn how to do a query where each row needs to be compared to the row predeceding it. I think I need to
use `window` and I'm hoping that works! If that doesn't work then I might explore scripting in the query with PL/pgSQL.

### Instructions

```
psql --username postgres --host localhost -f snapshots/snapshots-schema.ddl 
psql --username postgres --host localhost -f snapshots/snapshots-data.sql
```


### Referenced Material

* [Postgres official docs: "Window Functions" tutorial](https://www.postgresql.org/docs/13/tutorial-window.html)
* [Postgres official docs: "Window Functions" reference](https://www.postgresql.org/docs/13/functions-window.html)