SELECT
    drg_definition,
    total_discharges,
    provider_name,
    cast(provider_id as string) as provider_id,
    average_medicare_payments
FROM
    (
        SELECT
            drg_definition,
            total_discharges,
            provider_name,
            cast(provider_id as string) as provider_id,
            average_medicare_payments
        FROM `bigquery-public-data.medicare.inpatient_charges_2012`

        UNION ALL

        SELECT
            drg_definition,
            total_discharges,
            provider_name,
            provider_id,
            average_medicare_payments
        FROM `bigquery-public-data.cms_medicare.inpatient_charges_2012`
    ) combined_tables
ORDER BY average_medicare_payments DESC
LIMIT 10;
