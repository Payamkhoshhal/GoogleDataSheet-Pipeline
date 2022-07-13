# medbelle 

This repository is devided into two parts one is the python folder for loading data from google sheets to postgresql in aws rds and second is the dbt files and folders.


# dbt

In this project, you will see two models the first one is a raw model from the source of data which is in Postgres Aws rds and the second one is fact_calls. For creating fact_calls, I used the raw model.

There is a schema.yml file that describes tables and columns also some dbt built-in tests such as not null and unique were created on the columns. I created a generic test and used it for checking the total_duration with other existing durations (Ringing, Connected, and Wrap).

# python

Data from google sheets was extracted by getting access to gcp account and having required credentials. Then data was stored in pandas dataframe and was moved to postgres sql database in aws rds servic.
