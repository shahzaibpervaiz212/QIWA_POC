{{ config(materialized="view") }}


with
    source_data as (
        select
            loappointmentstatusid,
            loappointmentstatusar,
            loappointmentstatusen,
            active,
            orderserial,
            createdby,
            creationdate,
            lastmodifiedby,
            lastmodifieddate
        from {{ source("qiwa", "LABOROFFICEAPPOINMENTSTATUS") }}

    )

select *
from source_data
