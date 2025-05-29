# Slugs test

## Description of the experiment

Upon extrusion, material droplets are analyzed using the "slugs test", where a load cell measures the droplet mass as it falls into a bucket placed on a load cell, and a camera captures images to estimate its volume under the assumption of axisymmetry, for details seer [Bos & Wolfs (2022)](https://doi.org/10.1007/978-3-031-06116-5_67). From the droplet mass, the tensile strength and mass flow rate are predicted. Additionally, the density and volumetric flow rate are calculated from the droplet mass and volume. 

## Data collection

Data acquisition is managed by a Python program that reads load cell data from its OPC UA server, while images are captured using NI Vision Builder for Automated Inspection. All tools required for data acquisition and analysis are integrated into the software package [Droplet Detective](https://github.com/3DCP-TUe/DropletDetective). 

The __raw data__ folder for the slug test typically contains a time series file with load cell data and a subfolder with captured images. The __setupinfo__ folder contains a metadata file in YAML file format that details the hardware used and its settings, including the load cell and its signal filters, as well as the camera and its settings. The __processed data__ folder contains four files with time series data: the first file provides the yield stress derived from the droplet mass; the second, the mass flow rate; the third, the volume of a droplet obtained from the acquired images; and the last, the volume flow rate. The __scripts__ folder contains all the analysis files used to get these properties from the raw data.

## Processed data file format

The `processed_data` folder contains the following files:

---