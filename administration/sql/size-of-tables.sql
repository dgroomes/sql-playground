-- Show the size of tables.
-- Taken from StackOverflow https://stackoverflow.com/a/47655911
SELECT
    table_name,
    pg_size_pretty(table_size) AS table_size,
    pg_size_pretty(indexes_size) AS indexes_size,
    pg_size_pretty(total_size) AS total_size
FROM (
         SELECT
             table_name,
             pg_table_size(table_name) AS table_size,
             pg_indexes_size(table_name) AS indexes_size,
             pg_total_relation_size(table_name) AS total_size
         FROM (
                  -- tables from 'public'
                  SELECT table_name::text
                  FROM information_schema.tables
                  where table_schema = 'public' and table_type = 'BASE TABLE'
                  union
                  -- materialized views
                  SELECT oid::regclass::text as table_name
                  FROM pg_class
                  WHERE relkind = 'm'
                  order by table_name
              ) AS all_tables
         order by table_name
     ) AS pretty_sizes;
