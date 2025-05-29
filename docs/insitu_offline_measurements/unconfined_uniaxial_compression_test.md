# Unconfined uniaxial compresstion test (UUCT)

## Description of the experiment

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
| loading_rate                  | mm/s       |
| sample_radius                 | mm         |
| sample_height                 | mm         |
| stiffness_modulus             | MPa        |
| compressive_strength          | MPa        |

---

**`sample_i.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| time                          | HH:mm:ss   |
| age                           | HH:mm:ss   |
| load                          | N          |
| displacement                  | mm         |
| width                         | mm         |
| true_stress                   | MPa        |
| true_strain                   | N          |