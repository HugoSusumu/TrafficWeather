with daily_traffic_events as (
    select
        city,
        count(1)  as traffic_events,
        date_trunc('day', "StartTime(UTC)") as day
    from US_WEATHER_AND_TRAFFIC_EVENTS.TRAFFIC.US_TRAFFIC_EVENTS_RAW
    group by 1, 3
    order by 3, 1
)
select * from daily_traffic_events