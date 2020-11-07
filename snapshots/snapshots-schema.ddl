create table snapshots(
    date date,
    groundhog_appeared boolean
);

comment on column snapshots.groundhog_appeared is 'Did the groundhog appear on this day? If it appeared, then this column value is true';