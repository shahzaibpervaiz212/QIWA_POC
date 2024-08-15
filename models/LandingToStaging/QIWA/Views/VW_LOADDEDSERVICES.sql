
{{ config(
     materialized='view'

) }}


with source_data as (
select ID, SERVICENAMEAR, SERVICENAMEEN, STATUSID, CREATIONDATE, LASTMODIFIEDDATE, REQUESTERIDNO, REQUESTERNAME, REQUESTERUSERID, FK_REQUESTERTYPEID, ISQIWASCOPE
from   {{ source('qiwa','LOADDEDSERVICES') }}
 
)

select *
from source_data

