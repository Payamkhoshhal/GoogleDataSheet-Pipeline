{{ 
    config(        
        materialized='view'
    )
}}
select * from calls