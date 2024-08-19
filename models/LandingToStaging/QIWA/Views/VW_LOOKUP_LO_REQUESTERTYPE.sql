{{ config(materialized="view") }}

with
    source_data as (
        select
            id,
            descriptionar,
            descriptionen,
            creationdate,
            createdby,
            lastmodifieddate,
            lastmodifiedby
        from {{ source("qiwa", "LOOKUP_LO_REQUESTERTYPE") }}

    )

select *
from source_data
