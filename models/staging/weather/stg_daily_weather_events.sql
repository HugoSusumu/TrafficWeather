with daily_weather_events as (
    select
        city,
        count(1)  weather_events,
        date_trunc('day', "StartTime(UTC)") as day
    from {{ source('weather_events', 'US_WEATHER_EVENTS_RAW')}}
    group by 1, 3
    order by 3, 1
)

select * from daily_weather_events