
{{ config(
     materialized='view'

) }}

with source_data as (
Select ID, DESCRIPTIONAR, DESCRIPTIONEN, CREATIONDATE, CREATEDBY, LASTMODIFIEDDATE, LASTMODIFIEDBY 
FROM   {{ source('qiwa','LOOKUP_LO_REQUESTERTYPE') }}
 
)

select *
from source_data

