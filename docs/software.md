# Software

## Available software packages

Currently, three software packages are in use and maintained.

General tool to acquire the system data: 

- **[NodeRED-3DSeeP](https://github.com/3DCP-TUe/Node-RED-3DSeeP):** General dashboard and data logger for the modular 3DCP system.

Measurement / experiment specific tools: 

- **[Concrete Candy Tracker](https://github.com/3DCP-TUe/ConcreteCandyTracker):** Software used to measure the color value of the mortar inline. Typically used for tracer experiments. 
- **[Droplet Detective](https://github.com/3DCP-TUe/DropletDetective):** Tools and methodologies used to perform the so-called "slugs test".

Version control is applied to all software packages. More information about each individual software package can be found in their respective repositories.

## Software package structure

Each software package includes four standard folders:

- database template: Template to store the data acquired. 
- src: Contains all the source code.
    - scr/anlysis: Contains the scripts for data analysis (templates).
    - scr/acquisition: Contains all the files for data acquisition. 
- utils: Includes support materials, such as figures for the README, etc.

```
+-- software package
|   +-- database template
|   |   +-- raw_data
|   |   +-- processed_data
|   |   +-- scripts
|   |   +-- setupinfo
|   +-- src
|   |   +-- analysis
|   |   |   +-- script.m
|   |   |   +-- ...
|   |   +-- acquisition
|   |   |   +-- file1.py
|   |   |   +-- file1.py
|   |   |   +-- ...
|   +-- utils
|   |   ...
|   +-- README.md
|   +-- LICENSE
```
