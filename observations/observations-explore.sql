-- 'explore'-ing the data and features of Postgres itself
--
-- Materials referenced:
--   * https://dba.stackexchange.com/a/158088/194156 using the variadic keyword

select * from observations limit 10;

select description, concat_ws(';', unnest(notes)) from observations limit 10;

-- how do I join an array to a string and uses a given separator? E.g. CSV?
select concat_ws('-', 'one', 'two', 'blue'); -- works
select concat_ws('-', array['one', 'two', 'blue']); -- does not work
select concat_ws('-', variadic array['one', 'two', 'blue']); -- works!
