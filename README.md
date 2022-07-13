# medbelle (dbt)

This is the dbt repository for transferring raw data to the requested format.

In this project, you will see two models the first one is a raw model from the source of data which is in Postgres Aws rds and the second one is fact_calls. For creating fact_calls, I used the raw model.

There is a schema.yml file that describes tables and columns also some dbt built-in tests such as not null and unique were created on the columns. I created a generic test and used it for checking the total_duration with other existing durations (Ringing, Connected, and Wrap).
