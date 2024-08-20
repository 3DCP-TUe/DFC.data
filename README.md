# 3D Sneak Peek: 3DCP Database

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

## Introduction 
This repository contains the template and setup information library for the 3D Sneak Peek database. The aim of this project is to collect experimental data about 3D concrete printing in a structured way and distribute this data to the community. This repository includes the system library of the equipment at TU/e and the templates for data records and software packages.

## Structure

### Software structure

```
+-- software package
|   +-- database template
|   |   +-- data.csv
|   |   +-- ...
|   +-- src
|   |   +-- analysis
|   |   |   +-- script.py
|   |   +-- file1.py
|   |   +-- file1.py
|   |   ...
|   +-- utils
|   |   ...
```

### Database structure

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

### Setup info structure

#### Folder structure

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

#### Component folder structure

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

#### Coding system

To discuss: 

```
MC25F   Mortar coupling, 25 mm, female          (options: 25, 35, 50, female, male)
MC35M   Mortar coupling, 35 mm, male            (options: 25, 35, 50, female, male)
FL40    Flange DN40                             (options: 5, 10, 15, 20, 25, 32, 40, etc.)
TC93    Tri-clamp flange diameter 93 mm         (options: 25, 51, 64, 78, 91, 119, etc.)
PI6     Push-in fitting 6 mm outer diameter     (options: 4, 6, 8, 10, 12, etc.)
SO42    Slip-on 42 mm outer diameter
GEKA    GEKA coupling
PFD     Pressure flange for D-pump              (options: A, B, C, D, R, T, L-pump)
SFR     Suction flange for R-pump               (options: A, B, C, D, R, T, L-pump)
```

Examples

Logic `COUPLING_IN-COUPLING_OUT-DIAMETER-CUSTOM_PROPERTY-ID_NUMBER`

```
HOSE MC35F-MC35M-D35-L5000-1
REDUCER TC93-TC64-D73-D50-1
ELBOW MC35F-MC35M-D35-A90-1
ADAPTER FL40-MC35M-D35-1
CORIOLIS SENSOR FL40-FL40-D35-1
PRESSURE SENSOR MC35F-MC35M-D35-25BAR-1
PRESSURE SENSOR MC35F-MC35M-D35-25BAR-2
PRESSURE SENSOR MC35F-MC35M-D35-10BAR-1
```

## Version numbering

## Contact information

If you have any questions or comments about this project, please open an issue on the repository’s issue page. This can include questions about the content, such as missing information, and the data structure. We encourage you to open an issue instead of sending us emails to help establish an open community. By keeping discussions open, everyone can contribute and see the feedback and questions of others. In addition to this, please see our open science statement below.

## Open science statement

We are committed to the principles of open science to ensure that our work can be reproduced and built upon by others. Our approach includes the following key points:

- Reproducibility: We strive to make our work reproducible by sharing detailed methodologies and data.
- Unique Resources and Data: We have equipment and facilities that are not available at other institutes. We generate data that other institutes cannot produce, and we share this data openly.
- Data and Software Sharing: We share our data and software and encourage others to do the same. If others use our data and software, they must also share their software and data under similar terms.

To support these principles, we license our software under the General Public License version 3 or later (free to use, share with source code) and our data and documentation under CC BY-SA (free to use, with attribution, and share-alike). By adhering to these principles, we aim to encourage an open and collaborative scientific community. We hope and expect that if you use our resources, you will do the same. 

## License

Copyright (c) 2024 [3D Concrete Printing Research Group at Eindhoven University of Technology](https://www.tue.nl/en/research/research-groups/structural-engineering-and-design/3d-concrete-printing)

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg
