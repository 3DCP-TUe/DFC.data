# 3D Sneak Peek: 3DCP Database

## Software structure

```
+-- software package
|   +-- example
|   |   +-- data.csv
|   |   +-- metadata.yml
|   +-- src
|   |   +-- analysis
|   |   |   script.py
|   |   file1.py
|   |   ...
|   +-- utils
|   |   ...
```

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
+-- component
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
MC25F   Mortar coupling, 25 mm, female
MC35M   Mortar coupling, 35 mm, male
FL40    Flange DN40
TC93    Tri-clamp flange diameter 93 mm
PI6     Push-in fitting 6 mm outer diameter
SO42    Slip-on 42 mm outer diameter
GEKA    GEKA coupling
PFD     Pressure flange for D-pump     (options: A, B, C, d, R, T, L-pump)
SFR     Suction flange for R-pump      (options: A, B, C, d, R, T, L-pump)
```

Examples

Logic `COUPLING_IN-COUPLING_OUT-DIAMETER-CUSTOM_PROPERTY-ID_NUMBER`

```
HOSE MC35F-MC35M-D35-L5000--1
REDUCER TC93-TC64-D..-D..1
ELBOW MC35F-MC35M-D35-A90-1
ADAPTER FL40-MC35M-D35-1
CORIOLIS SENSOR FL40-FL40D-D35-1
PRESSURE SENSOR MC35F-MC35M-D35-25BAR-1
PRESSURE SENSOR MC35F-MC35M-D35-25BAR-2
PRESSURE SENSOR MC35F-MC35M-D35-10BAR-1
```