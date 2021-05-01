insert into numbers with
series as (
    select generate_series as x from generate_series(1,:rows)),
multiplied as (
    select x * random() from series)
select * from multiplied;
