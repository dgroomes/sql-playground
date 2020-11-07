# sql-playground

📚 Learning and exploring SQL (and Postgres in particular).

---

### Instructions

Requires: Docker
  
1. Start a Postgres instance using Docker Compose
    * Execute `docker-compose up --detach`
1. Explore the database!
    * Enter a session on the command line with `psql --username postgres --host localhost`
1. Define some test tables and test data
    * Apply the DDL and DML files
    * `psql --username postgres --host localhost -f observations/observations-schema.ddl` 
    * `psql --username postgres --host localhost -f observations/observations-data.sql` 
1. Stop the Postgres Docker container
    * Execute `docker-compose down`
