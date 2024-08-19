{{ config(materialized="view") }}


with
    source_data as (
        select
            loappointmenttimeid,
            loappointmenttimear,
            loappointmenttimeen,
            active,
            orderserial,
            createdby,
            creationdate,
            lastmodifiedby,
            lastmodifieddate
        from {{ source("qiwa", "LOOKUP_LOAPPOINTMENTTIME") }}

    )

select *
from source_data
