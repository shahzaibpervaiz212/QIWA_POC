{% snapshot Appointment %}


{{
    config(
      target_database='Dev_Staging',
      target_schema='qiwa',
      unique_key='id',

      strategy='timestamp',
      updated_at='LASTMODIFIEDDATE',
    )
}}

select * from {{ source('qiwa_Scds', 'LABOROFFICEAPPOINTMENT') }}

{% endsnapshot %}