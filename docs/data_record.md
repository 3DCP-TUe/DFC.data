# Data record 

The data record is organized in a folder structure. First, each record contains a metadata file that includes information about the authors and a description of the data record, explaining the purpose for which it was created. Second, each data record is divided into sub-folders, with each sub-folder corresponding to a session. Consequently, a single data record can contain multiple sessions, which may be grouped by topic, theme or publication. Besides the folders with sessions, it also includes a folder with scripts to perform analysis over multiple sessions. The figure below shows the standard format for a data record.

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

## Session folder
A session folder contains a session metadata file that describes the software versions used, the system layout (location of system components), the materials used and to which system component the materials were fed. Each session contains several folders, each holding the data acquired from a specific experiment. Two additional folders are included for videos and photos of the session. These can contain, for example, photos of the printed objects and the assembled system. Each session also has a script folder to analyze the correlation between the evolution data from different experiments and the process data within the session.

## Experiment folder

For each experiment folder, three sub-folders exist: raw data, processed data, and scripts. A metadata file for the experiment is also included. The organization of the folders with raw and processed data depends on the experiment and the typical data acquired. The scripts folder contains only the files necessary to perform analysis for this particular experiment.

## Scripts folder

As discussed, each level contains a script folder to perform data analysis at that particular level. Besides, the scripts folder can contain a subfolder called \textit{figures}, which holds visual representations of the data. This provides quick insights for first-time users of the dataset without requiring them to perform any analysis themselves. For instance, this can include time series plots of in-line temperature and pressure readings.
