{{ config(
    materialized="table"
) }}

select *,
       row_number() over (order by total_discharges desc) as row_num
from `bigquery-public-data.cms_medicare.inpatient_charges_2012`
order by total_discharges desc
limit 1
