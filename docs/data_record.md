# Data record 

## Structure

```
+-- datarecord
|   +-- yyyymmdd_session
|   |   +-- system_data
|   |   |   +-- raw_data
|   |   |   |   +-- yyyymmdd_name.csv
|   |   |   |   +-- yyyymmdd_name_event_comments.csv
|   |   |   +-- processed_data
|   |   |   |   +-- plot1.pdf
|   |   |   |   +-- ...
|   |   |   +-- scripts
|   |   |   |   +-- analysis.m
|   |   |   +-- metadata_setup.yml
|   |   +-- tracer_experiment
|   |   |   +-- raw_data
|   |   |   |   +-- yyyymmdd_name.csv
|   |   |   |   +-- yyyymmdd_name_event_comments.csv
|   |   |   +-- processed_data
|   |   |   |   +-- yyyymmdd_name.csv
|   |   |   |   +-- plot1.pdf
|   |   |   |   +-- ...
|   |   |   +-- scripts
|   |   |   |   +-- concrete_candy_tracker.m
|   |   |   +-- metadata_setup.yml
|   |   +-- slug_test
|   |   |   +-- raw_data
|   |   |   |   +-- yyyymmdd_name.csv
|   |   |   +-- processed_data
|   |   |   |   +-- yyyymmdd_name_results.csv
|   |   |   |   +-- plot1.pdf
|   |   |   |   +-- ...
|   |   |   +-- scripts
|   |   |   |   +-- droplet_detective.m
|   |   |   +-- metadata_setup.yml
|   |   +-- photos
|   |   |   +-- photo1.jpg
|   |   |   +-- ...
|   |   +-- videos
|   |   |   +-- video1.mp4
|   |   |   +-- ...
|   |   +-- metadata_session.yml
|   +-- yyyymmdd_session
|   |   +-- system_data
|   |   +-- metadata_session.yml
|   |   +-- ...
|   +-- setupinfo
|   +-- metadata_record.yml
|   +-- LICENSE
```

The analysis folders are meant to provide quick insights into the data. For example, time series plots of viscocity and pressure readings. Each software packages provides templates - example files - to generate this output. 