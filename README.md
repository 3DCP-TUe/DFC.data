# 3D Sneak Peek: 3DCP Database

## Database structure

```
+-- database
|   +-- session_yyyy_mm_dd
|   |   +-- node-red-3dseep
|   |   |   +-- analysis
|   |   |   |   +-- analysis.m
|   |   |   |   +-- plot1.pdf
|   |   |   |   +-- ...
|   |   |   +-- yyyymmdd_name.csv
|   |   |   +-- yyyymmdd_name_event_comments.csv
|   |   +-- concrete candy tracker
|   |   |   +-- analysis
|   |   |   |   +-- analysis.m
|   |   |   |   +-- plot1.pdf
|   |   |   |   +-- ...
|   |   |   +-- yyyymmdd_name.csv
|   |   |   +-- metadata.yml
|   |   +-- droplet detective
|   |   |   +-- analysis
|   |   |   |   +-- analysis.m
|   |   |   |   +-- plot1.pdf
|   |   |   |   +-- ...
|   |   |   +-- yyyymmdd_name.csv
|   |   |   +-- metadata.yml
|   |   +-- photos
|   |   |   +-- photo1.jpg
|   |   |   +-- ...
|   |   +-- videos
|   |   |   +-- video1.mp4
|   |   |   +-- ...
|   |   +-- metadata_session.yml
|   +-- session_yyyy_mm_dd
|   |   +-- node-red-3dseep
|   |   +-- ...
|   +-- setupinfo
|   +-- metadata_record.yml
```

The analysis folders are meant to provide quick insights into the data. For example, time series plots of viscocity and pressure readings. 

## Component structure

```
class: conduit
class: material delivery systems
    subclass: dosing systems
    subclass: mixer pumps
    sublcass: pumps
    subclass: silos/storage
class: motion systems
class: printheads  
    subclass: nozzles
    subclass: tubes
    subclass: inline mixers
class: sensors
```