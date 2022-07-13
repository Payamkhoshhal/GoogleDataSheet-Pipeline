-- Use the `ref` function to select from other models
select *
from {{ ref('source_calls') }}
--where index = 1
