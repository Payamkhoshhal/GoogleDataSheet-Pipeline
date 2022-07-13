{% test duration_stages_sum(model , column_name) %}

     select {{column_name}} 
    from {{model}}
    where {{column_name}} !=
    ringing_duration + connected_duration + wrap_duration

{% endtest %}
