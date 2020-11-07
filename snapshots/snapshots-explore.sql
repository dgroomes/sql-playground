select * from snapshots limit 10;

-- WORK IN PROGRESS
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

