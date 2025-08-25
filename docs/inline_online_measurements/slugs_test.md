# Slugs test

Data source folder: `slugs_test`

## Description of the experiment

Upon extrusion, material droplets are analyzed using the "slugs test", where a load cell measures the droplet mass as it falls into a bucket placed on a load cell, and a camera captures images to estimate its volume under the assumption of axisymmetry, for details see [Bos & Wolfs (2022)](https://doi.org/10.1007/978-3-031-06116-5_67). From the droplet mass, the tensile strength and mass flow rate are predicted. Additionally, the density and volumetric flow rate are calculated from the droplet mass and volume. 

## Data collection

Data acquisition is managed by a Python program that reads load cell data from its OPC UA server, while images are captured using NI Vision Builder for Automated Inspection. All tools required for data acquisition and analysis are integrated into the software package [Droplet Detective](https://github.com/3DCP-TUe/DropletDetective). 

The __raw_data__ folder for the slugs test typically contains a time series file with load cell data and a subfolder with captured images. The __setupinfo__ folder contains a metadata file in YAML file format that details the hardware used and its settings, including the load cell and its signal filters, as well as the camera and its settings. The __processed_data__ folder contains four files with time series data: the first file provides the yield stress derived from the droplet mass; the second, the mass flow rate; the third, the volume of a droplet obtained from the acquired images; and the last, the volume flow rate. The __scripts__ folder contains all the analysis files used to get these properties from the raw data.

## Processed data file format

The `processed_data` folder contains the following files:

---

**`yield_stress.csv`** contains droplet mass and yield stress measurement data over time.

| Column     | Description                                      |
|------------    |--------------------------------------------------|
| `time`         | Time in HH:mm:ss.SSS format                    |
| `droplet_mass` | Individual droplet mass [N]                      |
| `yield_stress` | Corresponding yield stress [kPa]                |

---

**`mass_flow.csv`** contains mass flow rate calculated per bucket.

| Column     | Description                                      |
|------------    |--------------------------------------------------|
| `deposition_time_start`         | Starting time of collecting material in the bucket in HH:mm:ss.SSS format                    |
| `deposition_time_mid`         | Mean time of collecting material in the bucket in HH:mm:ss.SSS format                    |
| `deposition_time_end`         | Ending time of collecting material in the bucket in HH:mm:ss.SSS format                    |
| `mass_flow` | Mass flow over the time window [kg/min]                      |

---

**`volumes.csv`** contains droplet volume data over time.

| Column     | Description                                      |
|------------    |--------------------------------------------------|
| `time`         | Time in HH:mm:ss.SSS format                    |
| `droplet_volume` | Individual droplet volume [cm³]                      |

---

**`volumes_grouped.csv`** contains droplet volume data that are grouped when duplicate measures of the same droplet have been taken.

| Column     | Description                                      |
|------------    |--------------------------------------------------|
| `time`         | Time in HH:mm:ss.SSS format                    |
| `mean_droplet_volume` | Mean droplet volume [cm³]                      |
| `std_droplet_volume` | Standard deviation of droplet volume [cm³]                      |

---

**`volumetric_flow.csv`** contains volumetric flow rate calculated per bucket.

| Column     | Description                                      |
|------------    |--------------------------------------------------|
| `deposition_time_start`         | Starting time of collecting material in the bucket in HH:mm:ss.SSS format                    |
| `deposition_time_mid`         | Mean time of collecting material in the bucket in HH:mm:ss.SSS format                    |
| `deposition_time_end`         | Ending time of collecting material in the bucket in HH:mm:ss.SSS format                    |
| `volumetric_flow_rate` | Volumetric flow rate over the time window [L/min]                      |
