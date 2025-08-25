# Unconfined uniaxial compresstion test (UUCT)

Data source folder: `uuct`

## Description of the data source

The UUCT is typically used to determine the early-age mechanical properties of the concrete within the first hours. In this destructive test, cylindrical specimens are made and compressed at distinct concrete ages. From this, the stiffness modulus and unconfined compressive strength can be derived. Details can be found in [Wolfs et al. (2018)](https://doi.org/10.1016/j.cemconres.2018.02.001). The test can be conducted in several test rigs and is selected depending on laboratory availability. From the test, the load-displacement data during sample loading is obtained. Additionally, optical measurements are used to measure the sample width during loading to calculate the true stress and strain.

## Data collection

Data collection depends on the test rig that is used. 

## Data storage

### Processed data file format

The `processed_data` folder contains at least the following files:

---

**`overview.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| deposition_date               | yyyy-MM-dd |
| deposition_time_start         | HH:mm:ss   |
| deposition_time_end           | HH:mm:ss   |
| testing_date                  | yyyy-MM-dd |
| testing_time                  | HH:mm:ss   |
| file_name                     | -          |
| loading_rate                  | mm/s       |
| sample_radius                 | mm         |
| sample_height                 | mm         |
| stiffness_modulus             | MPa        |
| compressive_strength          | MPa        |

---

**`sample_i.csv`**

|Columns                        | Units          |
|-------------------------------|----------------|
| time                          | HH:mm:ss.SSS   |
| load                          | N              |
| displacement                  | mm             |
| width                         | mm             |
