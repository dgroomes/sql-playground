# lag

Showcasing the `lag` Postgres function which is a part of Postgres' windowing support.

Specifically, I wanted to illustrate a query where each row needs to be compared to the row preceding it.


## Instructions

Follow these instructions to explore the windowing feature in Postgres.

1. Start the Postgres server
    * Use whatever method you prefer: HomeBrew, Docker, etc. Depending on how you install it, the username and database
      name will differ so take care to adjust the `psql` commands accordingly.
2. Apply the schema: 
    * ```shell
      psql postgres -f snapshots-schema.ddl
      ```
3. Insert test data:
    * ```shell
      psql postgres -f snapshots-data.sql
      ```
4. Try out the queries `snapshots-explore.sql` and learn about `lag`!    


## Reference

* [Postgres official docs: "Window Functions" tutorial](https://www.postgresql.org/docs/13/tutorial-window.html)
* [Postgres official docs: "Window Functions" reference](https://www.postgresql.org/docs/13/functions-window.html)
