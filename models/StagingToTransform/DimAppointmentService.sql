{{ config(
        materialized="table",

) }}

with
    DimAppointmentService as (

        select
            id AS ServiceId,
            servicenamear  as ServiceNameAr,
            servicenameen as ServiceNameEn,
            aa.statusid as Service_Statusid,
            aa.creationdate as Service_creationdate,
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

        from {{ ref('VW_LOADDEDSERVICES') }} aa
        right join {{ ref('VW_LOADDEDSUBSERVICES') }} bb on (aa.id = bb.fk_serviceid)

    )

select *
from DimAppointmentService
