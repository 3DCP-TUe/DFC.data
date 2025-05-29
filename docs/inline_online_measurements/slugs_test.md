# Slugs test

## Description of the experiment

Upon extrusion, material droplets are analyzed using the "slugs test", where a load cell measures the droplet mass as it falls into a bucket placed on a load cell, and a camera captures images to estimate its volume under the assumption of axisymmetry, for details seer [Bos & Wolfs (2022)](https://doi.org/10.1007/978-3-031-06116-5_67). From the droplet mass, the tensile strength and mass flow rate are predicted. Additionally, the density and volumetric flow rate are calculated from the droplet mass and volume. Data acquisition is managed by a Python program that reads load cell data from its OPC UA server, while images are captured using NI Vision Builder for Automated Inspection. All tools required for data acquisition and analysis are integrated into the software package [Droplet Detective](https://github.com/3DCP-TUe/DropletDetective). 

## Processed data files

The `processed_data` folder contains the following files:

---