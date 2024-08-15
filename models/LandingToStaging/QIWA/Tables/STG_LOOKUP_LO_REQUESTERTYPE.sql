
{{ config(
     materialized='table'

) }}

with source_data as (

    select * from {{ ref('vw_LOOKUP_LO_REQUESTERTYPE') }}

),

select *
from source_data