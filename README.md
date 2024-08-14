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

## Setup info structure

### Folder structure
```
class: conduit
class: material delivery systems
    main object: material delivery plc
    subclass: dosing systems
    subclass: inserts
    subclass: mixer pumps
    subclass: pumps
    subclass: silos/storage
class: motion systems
class: printheads
    main object: printhead plc
    subclass: inserts
    subclass: nozzles
    subclass: static
    subclass: dynamic
class: sensors
```

Inserts are components that are placed inside other components. Examples include feeding screws used in dosing systems and mixing blades.

### Component folder structure

```
+-- components
|   +-- name
|   |   +-- docs
|   |   |   +-- doc.pdf
|   |   |   +-- ...
|   |   +-- metadata.yml
|   |   +-- name.stl
|   |   +-- name.jpg
|   |   +-- ...
```

### Coding system for couplings

To discuss: 

```
MC25f   Mortar coupling, 25 mm, female          alternative: MT25
MC35m   Mortar coupling, 35 mm, male            alternative: VT35
F40     Flange DN40
T93     Tri-clamp diameter 93 mm
P6      Push-in fitting 6 mm outer diameter
S42     Slip-on 42 mm outer diameter
GEKA    GEKA coupling
```