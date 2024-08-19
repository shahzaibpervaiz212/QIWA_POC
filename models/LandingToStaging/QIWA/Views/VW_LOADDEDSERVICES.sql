{{ config(materialized="view") }}


with
    source_data as (
        select
            id,
            servicenamear,
            servicenameen,
            statusid,
            creationdate,
            lastmodifieddate,
            requesteridno,
            requestername,
            requesteruserid,
            fk_requestertypeid,
            isqiwascope
        from {{ source("qiwa", "LOADDEDSERVICES") }}

    )

select *
from source_data
