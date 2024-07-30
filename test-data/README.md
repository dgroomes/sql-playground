# test-data

Generate test data to aid in performance exploration and analysis.


## Overview

It's common to run into performance issues in production where accumulated data and high query volume to the database slows
down the execution times of queries. To have a chance of catching those issues at development-time, we need to simulate
this volume. Simulating concurrent connections and queries is a bit involved but simulating a large volume of simple test
data is easy! The `test-data` project shows how to generate a lot of basic data by using SQL commands.

---
**TLDR**: The trick is the `generate_series` function!

---


## Instructions

Follow these instructions to generate test data in a local Postgres database.

1. Start the Postgres server
    * Use whatever method you prefer: HomeBrew, Docker, etc. Depending on how you install it, the username and database
      name will differ so take care to adjust the `psql` commands accordingly.
2. Apply the schema:
    * ```shell
      psql -f numbers-schema.ddl
      ```
3. Generate one million rows of test data:
    * ```shell
      psql -f generate-numbers.sql -v rows=1000000
      ```
4. Execute a sort and notice how slow it is!
    * ```shell
      psql -c 'explain analyze select x from numbers order by x'
      ```
    * Note that the `explain analyze` will conveniently print the execution time and not print the result set. 
5. Generate **ten** million rows: 
    * ```shell
      psql -f generate-numbers.sql -v rows=10000000
      ```
6. Execute the same sort operation and notice how it is many times slower:
    * ```shell
      psql -c 'explain analyze select x from numbers order by x'
      ```


## Reference

* [Citus blog: *Fun with SQL: generate_series in Postgres*](https://www.citusdata.com/blog/2018/03/14/fun-with-sql-generate-sql/)
