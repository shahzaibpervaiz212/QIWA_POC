
{{ config(
     materialized='table'

) }}


select * from {{ ref('VW_LOOKUP_LO_REQUESTERTYPE') }}
