{{ config(materialized="view") }}

with
    source_data as (
        select
            id,
            officeid,
            laborofficeid,
            sequencenumber,
            establishmentid,
            clientserviceid,
            statusid,
            requesteridno,
            requestername,
            requesteruserid,
            appointmentdate,
            appointmenttime,
            rejectiondescription,
            mwtransactionid,
            creationdate,
            lastmodifieddate,
            regionid,
            operatoridno,
            channelid,
            updatereasonid,
            fk_requestertypeid,
            fk_subserviceid,
            status4date,
            status6date,
            realsessiontime,
            visitreasonid,
            weblink,
            meetingid
        from {{ source("qiwa", "LABOROFFICEAPPOINTMENT") }}

    )

select *
from source_data
