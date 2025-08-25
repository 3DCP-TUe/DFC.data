# Temperature: single-point

Data source folder: `temperature_point`

## Description of the data source

Single-point temperature measurements. 

## Data collection

Data collection depends on used measurement setup. 

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
| testing_time_start            | HH:mm:ss   |
| file_name                     | -          |
| position_x                    | mm         |
| position_y                    | mm         |
| position_z                    | mm         |

*Note:* If the sample position is not applicable (e.g., a non-spatial, off-line measurement), the position_x/y/z columns should still exist and be filled with `NaN`.

---

**`sample_i.csv`** or **`measurement_i.csv`**

|Columns                        | Units         |
|-------------------------------|---------------|
| time                          | HH:mm:ss.SSS  |
| age                           | HH:mm:ss.SSS  |
| temperature                   | °C            |
