{{ config(materialized="table") }}

with
    source_data as (

        select
            id,
            servicenamear,
            servicenameen,
            aa.statusid as service_statusid,
            aa.creationdate as service_creationdate,
            aa.lastmodifieddate as service_lastmodifieddate,
            aa.requesteridno as service_requesteridno,
            aa.requestername as service_requestername,
            aa.requesteruserid as service_requesteruserid,
            fk_requestertypeid,
            isqiwascope,

            pk_loaddedsubservices,
            subservicenamear,
            subservicenameen,
            bb.statusid as subservice_statusid,
            fk_serviceid,
            bb.requesteridno as subservice_requesteridno,
            bb.requestername as subservice_requestername,
            bb.requesteruserid as subservice_requesteruserid,
            bb.creationdate as subservice_creationdate,
            createdby,
            bb.lastmodifieddate as subservice_lastmodifieddate,
            lastmodifiedby

        from {{ ref('vw_loaddedservices') }} aa
        left join {{ ref('vw_loaddedsubservices') }} bb on (aa.id = bb.fk_serviceid)

    )

select *
from source_data
