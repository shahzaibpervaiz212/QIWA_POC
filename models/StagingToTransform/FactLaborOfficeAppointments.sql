{{
    config(
        materialized="table",
    )
}}

with
    factlaborofficeappointments as (

select

            id as appointmentid,
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
            --realsessiontime,
            visitreasonid,
            CASE WHEN COALESCE(visitreasonid,'1') = '1' THEN 'حضوري' ELSE 'افتراضي' END AS AppointmentTypeAr,
            CASE WHEN COALESCE(visitreasonid,'1') = '1' THEN 'Physical'  ELSE 'Virtual' END AS AppointmentTypeEn ,
            substring(realsessiontime, CHARINDEX('minutes',realsessiontime) + len(' minutes') ,(CHARINDEX(' seconds',realsessiontime))  - (CHARINDEX('minutes',realsessiontime) + len(' minutes'))) RealSessionTime, 
            weblink,
            meetingid

        from {{ ref("VW_LABOROFFICEAPPOINTMENT") }} 
      

    )

select *
from factlaborofficeappointments
