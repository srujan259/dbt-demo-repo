{{ config(
    materialized="table"
) }}

select
    drg_definition,
    total_discharges,
    provider_name,
    cast(provider_id as string) as provider_id,
    average_medicare_payments
from
    (
        select
            drg_definition,
            total_discharges,
            provider_name,
            cast(provider_id as string) as provider_id,
            average_medicare_payments
        from `bigquery-public-data.medicare.inpatient_charges_2012`

        union all

        select
            drg_definition,
            total_discharges,
            provider_name,
            provider_id,
            average_medicare_payments
        from `bigquery-public-data.cms_medicare.inpatient_charges_2012`
    ) combined_tables
order by average_medicare_payments desc
limit 10
