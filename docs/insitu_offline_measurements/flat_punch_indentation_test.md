# Flat Punch Indentation Test (FPIT)

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
| indenter_radius               | mm         |
| sample_radius                 | mm         |
| stiffness_modulus             | MPa        |
| compressive_strength          | MPa        |
| cohesion                      | MPa        |
| friction_angle                | degrees    |

**`sample_i.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| time                          | HH:mm:ss   |
| age                           | HH:mm:ss   |
| load                          | N          |
| depth                         | mm         |