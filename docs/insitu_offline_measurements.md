# In-situ and off-line measurements

## Ultrasound wave transmission test (UWTT)

The `processed_data` folder contains at least the following files:

---

**`overview.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| deposition_date               | yyyy-MM-dd |
| deposition_time_start         | hh:mm:ss   |
| deposition_time_end           | hh:mm:ss   |
| testing_date                  | yyyy-MM-dd |
| testing_time_start            | hh:mm:ss   |
| file_name                     | -          |

**`sample_i.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| time                          | hh:mm:ss   |
| age                           | hh:mm:ss   |
| velocity                      | m/s        |
| acceleration                  | m/s²       |
| temperature                   | °C         |

## Temperature

The `processed_data` folder contains at least the following files:

---

**`overview.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| deposition_date               | yyyy-MM-dd |
| deposition_time_start         | hh:mm:ss   |
| deposition_time_end           | hh:mm:ss   |
| testing_date                  | yyyy-MM-dd |
| testing_time_start            | hh:mm:ss   |
| file_name                     | -          |

**`sample_i.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| time                          | hh:mm:ss   |
| age                           | hh:mm:ss   |
| temperature                   | °C         |

## Unconfined Uniaxial Compresstion Test (UUCT)

The `processed_data` folder contains at least the following files:

---

**`overview.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| deposition_date               | yyyy-MM-dd |
| deposition_time_start         | hh:mm:ss   |
| deposition_time_end           | hh:mm:ss   |
| testing_date                  | yyyy-MM-dd |
| testing_time_start            | hh:mm:ss   |
| file_name                     | -          |
| loading_rate                  | mm/s       |
| sample_radius                 | mm         |
| sample_height                 | mm         |
| stiffness_modulus             | MPa        |
| compressive_strength          | MPa        |

**`sample_i.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| time                          | hh:mm:ss   |
| age                           | hh:mm:ss   |
| load                         | N          |
| displacement                  | mm         |
| width                         | mm         |
| true_stress                   | MPa        |
| true_strain                   | N          |

## Flat Punch Indentation Test (FPIT)

The `processed_data` folder contains at least the following files:

---

**`overview.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| deposition_date               | yyyy-MM-dd |
| deposition_time_start         | hh:mm:ss   |
| deposition_time_end           | hh:mm:ss   |
| testing_date                  | yyyy-MM-dd |
| testing_time_start            | hh:mm:ss   |
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
| time                          | hh:mm:ss   |
| age                           | hh:mm:ss   |
| load                          | N          |
| depth                         | mm         |

## Pocket shear vane

The `processed_data` folder contains at least the following files:

---

**`overview.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| deposition_date               | yyyy-MM-dd |
| deposition_time_start         | hh:mm:ss   |
| deposition_time_end           | hh:mm:ss   |
| testing_date                  | yyyy-MM-dd |
| testing_time_start            | hh:mm:ss   |
| sample_diameter               | mm         |
| sample_height                 | mm         |
| sample_mass                   | g          |
| loading_rate                  | kN/s       |
| density                       | kg/m³      |
| failure_load                  | kN         |
| compressive_strength          | MPa        |
