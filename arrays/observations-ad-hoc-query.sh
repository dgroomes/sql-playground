#!/usr/bin/env bash
# Execute an ad hoc query from a shell script against the Postgres database.
# Specifically, we want to see if we can use a heredoc to define the query.

psql << EOF
select format('"%s"', description), array_length(notes, 1) from observations
EOF
