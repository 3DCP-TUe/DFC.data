# Flat Punch Indentation Test (FPIT)

## Description of the experiment

The FPIT is a compression test where a cylindrical flat punch indenter is pressed into the surface of a significantly larger molded sample. As for the UUCT, this is a single-point destructive test used to assess the early-age mechanical properties of the material by testing several samples at different ages. From the measured indentation response, the stiffness modulus, cohesion, and friction angle can be derived. The experiment can be conducted in similar test rigs, identical to those used for the UUCT, as only the indentation load and depth need to be recorded. The theory and methodology to derive the mechanical properties from the indentation response are described in detail in Deetman & Suiker (publication in preperation). 

## Data collection

Data collection depends on the test rig that is used. 

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