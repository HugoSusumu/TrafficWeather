with big_cities as (
    select
        city
    from {{ref ('uscitypopdensity')}}
        order by traffic_events desc
        limit 200
),
days as(
    select days from 
)
