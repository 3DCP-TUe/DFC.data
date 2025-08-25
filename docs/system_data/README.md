# System data

Data source folder: `system_data`

## Description of the data source

System data is a specialized type of data source that tends to be more complex to describe than a typical experiment. It provides a structured and comprehensive record of the materials used, the system components involved, and a description of the system layout. In addition to this descriptive information, system data also includes all measurements and control signals acquired from the processing system. This covers the operational state of motors, readings from in-line sensors, and other relevant signals captured during the session. By combining detailed metadata with real-time process data, system data enables a deeper understanding of how materials and components interact during operation. 

## Data collection

At TU/e the system data is collected via the software package [Node-RED 3DSeeP](https://github.com/3DCP-TUe/Node-RED-3DSeeP) which is developed within the open-source Node-RED programming environment and runs on a desktop computer. In Node-RED, OPC UA clients are configured to read and write data to the various OPC UA servers distributed across the system. Data is collected at a sampling frequency of 10 Hz and is displayed in real-time on a dashboard. The equipment and standard outputs of the distributed I/O can also be controlled via the Node-RED dashboard. Additionally, since all data from the various devices is available on this platform, Node-RED is functionally programmed to synchronize components, for example, aligning the behavior of a dosing system with that of a mixing pump that both have their own OPC UA interface. 

## Data storage

The __raw data__ contains a log file with time-series data collected using the Node-RED-based data logger. The __setupinfo__ folder includes subfolders for material components and system components, where all used materials and system components are described. Alongside these, a YAML metadata file defines how materials and components interact—specifically, which component each material was fed into and how the components were assembled. The __processed data__ consists of a cleaned time-series table derived from the raw log file. Cleaning typically involves removing columns related to unused system components and applying corrections if errors occurred during data logging (e.g., incorrect signal conversion settings in the data logger). The __scripts__ folder contains the files used to generate the processed data from the raw data.

### File formats and structure

The system data is organized into a structured folder layout that supports both documentation and automated processing. The format is based on YAML metadata files and time-series logs.

System components are described using individual metadata files that detail their attributes, dimensions, couplings, I/O interfaces, sensors, and logged data. These files follow a standardized format, as outlined in the [system components documentation](system_components.md). Each material component is also described by a metadata file, as explained in the [material components documentation](system_components.md). Both material and system components follow the same folder structure; only the content of the metadata file differs.

The metadata file is stored within the component’s folder, which may also include additional resources. For system components, at least one photo is always included. Depending on the component’s characteristics and availability of resources, other files—such as a 3D model (e.g., `.stl` file) or a `docs` folder containing electrical schematics, calibration reports, or manufacturer documentation can also be provided.

For all components, the following general folder structure is used:

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

The overall system configuration—including how materials are fed into components and how components are connected—is defined in the system data metadata file. This file contains structured sections describing the materials, motion systems, software, system layout, and I/O configuration. These sections allow the system setup to be reconstructed and the relationships between materials, components, and signals to be understood. More details can be found in the [system metadata file documentation](metadata_file.md).
