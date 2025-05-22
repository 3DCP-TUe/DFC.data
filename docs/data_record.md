# Data record 

The data record is organized in a folder structure. First, each record contains a metadata file that includes information about the authors and a description of the data record, explaining the purpose for which it was created. Second, each data record is divided into sub-folders, with each sub-folder corresponding to a session. Consequently, a single data record can contain multiple sessions, which may be grouped by topic, theme or publication. Besides the folders with sessions, it also includes a folder with scripts to perform analysis over multiple sessions. The figure below shows the standard format for a data record.

```
+-- datarecord
|   +-- yyyymmdd_session_i
|   |   +-- system_data
|   |   |   +-- raw_data
|   |   |   |   +-- yyyymmdd_name.csv
|   |   |   |   +-- yyyymmdd_name_event_comments.csv
|   |   |   +-- processed_data
|   |   |   |   +-- plot1.pdf
|   |   |   |   +-- ...
|   |   |   +-- setupinfo
|   |   |   |   +-- component-1
|   |   |   |   +-- component-2
|   |   |   +-- scripts
|   |   |   |   +-- analysis.m
|   |   +-- tracer_experiment
|   |   |   +-- raw_data
|   |   |   |   +-- yyyymmdd_name.csv
|   |   |   |   +-- yyyymmdd_name_event_comments.csv
|   |   |   +-- processed_data
|   |   |   |   +-- yyyymmdd_name.csv
|   |   |   |   +-- plot1.pdf
|   |   |   |   +-- ...
|   |   |   +-- setupinfo
|   |   |   |   +-- metadata.yml
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
|   |   |   +-- setupinfo
|   |   |   |   +-- metadata.yml
|   |   |   +-- scripts
|   |   |   |   +-- droplet_detective.m
|   |   +-- photos
|   |   |   +-- photo1.jpg
|   |   |   +-- ...
|   |   +-- videos
|   |   |   +-- video1.mp4
|   |   |   +-- ...    
|   |   +-- metadata_session.yml
|   +-- yyyymmdd_session_j
|   |   +-- system_data
|   |   +-- metadata_session.yml
|   |   +-- ...
|   +-- analysis
|   |   +-- figures
|   |   +-- tables
|   |   +-- script.m
|   |   +-- ...
|   +-- metadata_record.yml
|   +-- LICENSE
```

## Session folder
A session folder contains a session metadata file that describes the software versions used, the system layout (location of system components), the materials used and to which system component the materials were fed. Each session contains several folders, each holding the data acquired from a specific experiment. Two additional folders are included for videos and photos of the session. These can contain, for example, photos of the printed objects and the assembled system.

## Experiment folder

For each experiment folder, three subfolders exist: raw data, processed data, setupinfo, and scripts. The organization of the folders with raw and processed data depends on the experiment and the typical data acquired. The scripts folder contains only the files necessary to perform analysis for this particular experiment.

## Analysis folder

Each data record contains an analysis folder that contains all files used to analyse the whole session, such as finding correlations between the different sessions and experiments in the data record. In addition to the scripts, the folder can contain subfolders to store figures and tables. This provides quick insights for first-time users of the dataset without requiring them to perform any analysis themselves. 
