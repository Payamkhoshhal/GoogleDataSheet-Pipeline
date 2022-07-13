{{ 
    config(        
        materialized='table'
    )
}}
select 
record_id + 1 as id , -- the identity record_id was started from 0 added 1 to it
index as sequence_number , -- a id for indexing each guids in the events
 guid ,
start_timestamp , 
cast( party ->> 'id' as integer) as agent_id , -- get the id of each agent 
duration  as total_duration , -- duration of each set of events according to the guid
"endReason" , -- call end reason
case when events -> 0 ->> 'type' = 'Ringing' then cast(events -> 0 ->> 'duration' as integer) 
end Ringing_duration, --get the ringing duration from call events 
case when  events -> 1 ->> 'type' = 'Connected' then cast(events -> 1 ->> 'duration' as integer)
when events -> 2 ->> 'type' = 'Connected' then cast(events -> 2 ->> 'duration'as integer)
end Connected_duration, -- get the connected duration which can be stored in 2 different positions
case when  events -> 1 ->> 'type' = 'Wrap' then cast(events -> 1 ->> 'duration' as integer) 
when events -> 2 ->> 'type' = 'Wrap' then cast (events -> 2 ->> 'duration'as integer )
when events -> 3 ->> 'type' = 'Wrap' then cast (events -> 3 ->> 'duration'as integer ) 
when events -> 4 ->> 'type' = 'Wrap' then cast (events -> 4 ->> 'duration'as integer )
when events -> 5 ->> 'type' = 'Wrap' then cast (events -> 5 ->> 'duration' as integer )
end Wrap_duration -- get the Wrap duration which can be stored in 5 different position
from {{ ref('raw_calls')}} -- read the date from raw model
where party ->> 'role' = 'Agent' -- there are some other roles in data like External and Monitor

