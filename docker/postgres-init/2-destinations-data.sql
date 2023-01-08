-- Populate the destinations table arbitrarily. Conveniently, Postgres bundles time zone names and they describe various
-- locations around the world. It's not a perfect match, but it's a convenient kludge.
insert into destinations (region, name)
    select 'Africa', regexp_replace(name, '^Africa/', '') from pg_timezone_names where name ~ '^Africa/.*' union
    select 'Asia', regexp_replace(name, '^Asia/', '') from pg_timezone_names where name ~ '^Asia/.*' union
    select 'Europe', regexp_replace(name, '^Europe/', '') from pg_timezone_names where name ~ '^Europe/.*' union
    select 'US', regexp_replace(name, '^US/', '') from pg_timezone_names where name ~ '^US/.*';
