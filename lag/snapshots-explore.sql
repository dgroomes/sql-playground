select * from snapshots limit 10;

-- Contrast the *current* value of "groundhog_appeared" with its *immediately preceding* value
--
-- The `lag` function fits exactly this requirement. Interestingly, though, the "lag" function can only be used in the
-- context of a window operation but we don't have any logical requirement to split up the table in different windows.
-- So, to work around this Postgres technical constraint, we just apply a global window equal to the whole table by
-- doing `partition by 1`.
--
-- The result set looks like this:
-- date	groundhog_appeared	groundhog_appeared_yesterday
-- 2020-11-01	true
-- 2020-11-02	false	true
-- 2020-11-03	false	false
-- 2020-11-04	true	false
-- 2020-11-05	true	true
select date, groundhog_appeared, lag(groundhog_appeared) over (partition by 1) as groundhog_appeared_yesterday from snapshots order by date;

-- Building off of the "lag" pattern we discovered in the previous query, let's identify rows where a groundhog_appeared
-- "transition" occurred. By transition, I mean: is today's value of "groundhog_appear" different from the previous day?
-- Rather, did the value *transition*?
--
-- The result set looks like this:
-- date	transition
-- 2020-11-02	the groundhog disappeared
-- 2020-11-04	the groundhog appeared 🐿
--
-- This is what we expect. The groundhog disappeared on 11/2 so we see a record for that date. The groundhog continued
-- to not appear on 11/3 so we do not see a record on that date because that is not a transition. Then, on 11/4 the
-- groundhog appeared and we see a record.
with lag_adorned as (
    select date, groundhog_appeared, lag(groundhog_appeared) over (partition by 1) as groundhog_appeared_yesterday from snapshots order by date),
transitions as (
    select * from lag_adorned where groundhog_appeared != groundhog_appeared_yesterday),
synthesized as (
    select date,
           case when
               groundhog_appeared then 'the groundhog appeared 🐿'
               else 'the groundhog disappeared'
           end as transition
    from transitions)
select * from synthesized;
