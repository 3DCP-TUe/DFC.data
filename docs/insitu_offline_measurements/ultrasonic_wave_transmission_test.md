# Ultrasonic wave transmission test (UWTT)

## Description of the experiment

The UWTT can be used in-situ, but is used in our facilities as an off-line test on material sampled from the system. With this test, ultrasonic waves are continuously sent through objects from which the material stiffness can be predicted. The test is performed using compression (P) waves according to NEN-EN 12504-4 in a commercially available system (IP-8 Measuring System from UltraTest GmbH, Germany). Details can be found in [Wolfs et al. (2018)](https://doi.org/10.1016/j.conbuildmat.2018.06.060).  

## Data collection

The commercially available software that comes with the device is used to acquire the data.

## Processed data files

The `processed_data` folder contains at least the following files:

---

**`overview.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| deposition_date               | yyyy-MM-dd |
| deposition_time_start         | HH:mm:ss   |
| deposition_time_end           | HH:mm:ss   |
| testing_date                  | yyyy-MM-dd |
| testing_time_start            | HH:mm:ss   |
| file_name                     | -          |

---

**`sample_i.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| time                          | HH:mm:ss   |
| age                           | HH:mm:ss   |
| velocity                      | m/s        |
| acceleration                  | m/s²       |
| temperature                   | °C         |