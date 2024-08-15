
{{ config(
     materialized='view'

) }}

with source_data as (
SELECT ID, OFFICEID, LABOROFFICEID, SEQUENCENUMBER, ESTABLISHMENTID, CLIENTSERVICEID, STATUSID, REQUESTERIDNO, REQUESTERNAME, REQUESTERUSERID, APPOINTMENTDATE, APPOINTMENTTIME, REJECTIONDESCRIPTION, MWTRANSACTIONID, CREATIONDATE, LASTMODIFIEDDATE, REGIONID, OPERATORIDNO, CHANNELID, UPDATEREASONID, FK_REQUESTERTYPEID, FK_SUBSERVICEID, STATUS4DATE, STATUS6DATE, REALSESSIONTIME, VISITREASONID, WEBLINK, MEETINGID
from    {{ source('qiwa','LABOROFFICEAPPOINTMENT') }}
 
)

select *
from source_data

