with daily_traffic_events as (
    select
        city,
        count(1)  as traffic_events,
        date_trunc('day', "StartTime(UTC)") as day
    from {{source ('traffic_events', 'US_TRAFFIC_EVENTS_RAW')}}
    where city is not null
    group by city, day
    order by day, city
)
select * from daily_traffic_events