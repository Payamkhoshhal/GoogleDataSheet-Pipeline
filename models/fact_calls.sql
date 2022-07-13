{{ 
    config(
        
        materialized='table'
    )

}}

select record_id + 1 as id , index as sequence_number , guid , start_timestamp ,
 cast( party ->> 'id' as integer) as agent_id , duration  as total_duration , "endReason" ,
case when events -> 0 ->> 'type' = 'Ringing' then cast(events -> 0 ->> 'duration' as integer) end Ringing_duration,
case when  events -> 1 ->> 'type' = 'Connected' then cast(events -> 1 ->> 'duration' as integer)
when events -> 2 ->> 'type' = 'Connected' then cast(events -> 2 ->> 'duration'as integer)
end Connected_duration,
case when  events -> 1 ->> 'type' = 'Wrap' then cast(events -> 1 ->> 'duration' as integer) 
when events -> 2 ->> 'type' = 'Wrap' then cast (events -> 2 ->> 'duration'as integer )
when events -> 3 ->> 'type' = 'Wrap' then cast (events -> 3 ->> 'duration'as integer ) 
when events -> 4 ->> 'type' = 'Wrap' then cast (events -> 4 ->> 'duration'as integer )
when events -> 5 ->> 'type' = 'Wrap' then cast (events -> 5 ->> 'duration' as integer )
end Wrap_duration
from {{ ref('raw_calls')}}
where party ->> 'role' = 'Agent'

