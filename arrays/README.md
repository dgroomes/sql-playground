# arrays

Showcasing the `array` SQL data type.

A dataset of "observations" is used to explore the `array` data type.


## Instructions

Follow these instructions to explore arrays in Postgres.

1. Start the Postgres server
    * Use whatever method you prefer: HomeBrew, Docker, etc. Depending on how you install it, the username and database
      name will differ so take care to adjust the `psql` commands accordingly. 
2. Apply the schema:
    * ```shell
      psql -f observations-schema.ddl
      ```
3. Insert test data:
    * ```shell
      psql -f observations-data.sql
      ```
4. Try out the queries in `observations-explore.sql` and learn about SQL arrays!
    * For example, execute the `observations-ad-hoc-query.sh` with the following command.
    * ```shell
      ./observations-ad-hoc-query.sh
      ```
    * It will output the following.
    * ```text
                  format            | array_length 
      ------------------------------+--------------
      "groundbreaking observation" |            1
      "underwhelming observation"  |            2
      (2 rows)
      ```
