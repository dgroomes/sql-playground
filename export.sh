#!/usr/bin/env bash
# Export data from the Postgres database
# Instead of the raw formatting that Postgres would apply by default, it applies some additional formatting.
#
# References used:
#  * https://www.postgresql.org/docs/13/functions-string.html

psql --username postgres --host localhost \
-c "\copy (select description, concat_ws(';', variadic notes) from observations) to stdout;"
