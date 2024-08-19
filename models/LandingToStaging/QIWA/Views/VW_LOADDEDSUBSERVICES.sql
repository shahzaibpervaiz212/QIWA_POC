{{ config(materialized="view") }}

with
    source_data as (
        select
            pk_loaddedsubservices,
            subservicenamear,
            subservicenameen,
            statusid,
            fk_serviceid,
            requesteridno,
            requestername,
            requesteruserid,
            creationdate,
            createdby,
            lastmodifieddate,
            lastmodifiedby
        from {{ source("qiwa", "LOADDEDSUBSERVICES") }}

    )

select *
from source_data
