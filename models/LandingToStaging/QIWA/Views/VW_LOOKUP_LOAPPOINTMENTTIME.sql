
{{ config(
     materialized='view'

) }}


with source_data as (
SELECT 
LOAPPOINTMENTTIMEID, LOAPPOINTMENTTIMEAR, LOAPPOINTMENTTIMEEN, ACTIVE, ORDERSERIAL, CREATEDBY, CREATIONDATE, LASTMODIFIEDBY, LASTMODIFIEDDATE
FROM   {{ source('qiwa','LOOKUP_LOAPPOINTMENTTIME') }}
 
)

select *
from source_data

