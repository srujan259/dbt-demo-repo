{{ config(
    materialized="table"
) }}

with highest_discharges as (
    select
        *,
        row_number() over (order by total_discharges desc) as row_num
    from `bigquery-public-data.cms_medicare.inpatient_charges_2012`
)

select *
from highest_discharges
where row_num = 1;
