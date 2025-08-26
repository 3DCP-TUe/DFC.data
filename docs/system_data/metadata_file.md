# System data metadata file

## File format

The description of the materials used and the assembly of system components is stored in the system metadata file. This file provides a structured, YAML-based representation of the system configuration and use materials. It includes several sections, each detailing specific aspects of the materials and system used during a session. A system data metadata file contains the following sections:

- **materials:** Lists all materials used during the session, including the system components to which each material was supplied. This section enables a direct correlation between the materials and the recorded process values, facilitating the study of the relationship between material composition and process data, and subsequently the evolution data.
- **motion systems:** Provides details about the automated movement systems used during the session, such as gantry robots or industrial robot arms. This ensures that accurate position data is obtained to correlate in-line measurements on materials to their location within an object.
- **software:** Specifies the software packages used for data acquisition and control, including their names and version numbers. This supports reproducibility and enables corrections if errors are later discovered in the data acquisition process (e.g., incorrect conversion values).
- **system layout:** Defines how the system was assembled by listing all components used. For each component, its connections to other components are described by following the material flow direction. The hierarchical structure allows reconstruction of the setup and understanding of how materials, signals, and mechanical elements interact.
- **i/o configuration:** Describes the input/output channels used for system control and data acquisition. This section links specific system components, such as sensors, to the I/O ports used on data acquisition systems. With this information, measured signals stored in the system data log file can be linked to the respective component.

An example of a system metadata file can be found [here](/src/template/yyyymmdd_session_1/system_data/setupinfo/metadata.yml).

## Data Flow

The hierarchical structure of the system data enables automatic navigation through the data files. First, the system data file, the section `system_layout` specifies which components are used and how they are connected. Additionally, the `materials` section identifies the component through which each material is fed, allowing the material flow path through the system to be traced. This structured approach allows the relationships between materials and system components to be represented in an ontology, enabling clear visualization of their interactions. Scripts to navigate through these files and create an ontology can be found [here](/src/analysis/).
