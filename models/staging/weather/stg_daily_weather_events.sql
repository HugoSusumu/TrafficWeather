with daily_weather_events as (
    select
        city,
        count(1)  weather_events,
        date_trunc('day', "StartTime(UTC)") as day
    rom {{source ('weather_events', 'US_WEATHER_EVENTS_RAW')}}
    where city is not null
    group by city, day
    order by day, city
)

select * from daily_weather_events