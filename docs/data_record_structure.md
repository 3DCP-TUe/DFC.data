# Data record 

The data record is organized in a folder structure containing: 
- **yyymmdd_session_i**: A single data record can contain multiple sessions, which may be grouped by topic, theme or publication. A session folder contains a session metadata file that describes the software versions used, the system layout (location of system components), the materials used and to which system component the materials were fed. Each session contains several folders, each holding the data acquired from a specific data source. Two additional folders are included for videos and photos of the session. These can contain, for example, photos of the printed objects and the assembled system.
  - **data_source**: For each data source folder, three subfolders exist: setupinfo, raw data, processed data, and scripts. The **setupinfo** folder contains metadata that describes the experiment. The **scripts** folder contains only the scripts that process the **raw data** of that specific experiment and saves it in the **processed_data** folder, allowing for reproducibility. The format of the process_data folder is predifined for the following sources:
    
    In-line and on-line measurements　    
      - [system_data](docs/inline_online_measurements/system_data.md)
      - [slugs_test](docs/inline_online_measurements/slugs_test.md)
      - [tracer_experiment](docs/inline_online_measurements/tracer_experiment.md)
        
    In-situ and off-line measurements
      - [compression_test](docs/insitu_offline_measurements/compression_test.md)
      - [flat_punch_indentation_test](docs/insitu_offline_measurements/flat_punch_indentation_test.md) (FPIT)
      - [pocket_shear_vane](docs/insitu_offline_measurements/pocket_shear_vane_test.md)
      - [temperature](docs/insitu_offline_measurements/temperature.md)
      - [ultrasound_wave_transmission_test](docs/insitu_offline_measurements/ultrasonic_wave_transmission_test.md) (UWTT)
      - [unconfined_uniaxial_compresstion_test](docs/insitu_offline_measurements/unconfined_uniaxial_compression_test.md) (UUCT)
- **analysis**: contains scripts to perform analysis over multiple sessions.
- **metadata_record.yml**: Each record contains a metadata file that includes information about the authors and a description of the data record, explaining the purpose for which it was created.

The figure below shows a typical folder structure of a dataset.

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
|   +-- yyyymmdd_session_i+1
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
