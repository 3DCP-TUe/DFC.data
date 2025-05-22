# In-situ and off-line measurements

## Data per experiment

Note: add `deposition_date` and `testing_date`

| Experiment | Type        | Overview File Columns                        | Units     | Sample File Columns           | Units     |
|------------|-------------|----------------------------------------------|-----------|-------------------------------|-----------|
| uwtt       | continuous  | id                                           | -         | time                          | hh:mm:ss  |
|            |             | deposition_time                              | hh:mm:ss  | age                           | hh:mm:ss  |
|            |             | deposition_end                               | hh:mm:ss  | age                           | hh:mm:ss  |
|            |             | testing_time                                 | hh:mm:ss  | velocity                      | m/s       |
|            |             | file_name                                    | -         | acceleration                  | m/s²      |
|            |             |                                              |           | temperature                   | °C        |
|            |             |                                              |           |                               |           |
| temperature| continuous  | id                                           | -         | time                          | hh:mm:ss  |
|            |             | deposition_time                              | hh:mm:ss  | age                           | hh:mm:ss  |
|            |             | deposition_end                               | hh:mm:ss  | age                           | hh:mm:ss  |
|            |             | testing_time                                 | hh:mm:ss  | temperature                   | °C        |
|            |             | file_name                                    | -         |                               |           |
|            |             |                                              |           |                               |           |
| uuct       | single-point| id                                           | -         | time                          | hh:mm:ss  |
|            |             | deposition_time                              | hh:mm:ss  | force                         | N         |
|            |             | deposition_end                               | hh:mm:ss  | age                           | hh:mm:ss  |
|            |             | testing_time                                 | hh:mm:ss  | displacement                  | mm        |
|            |             | file_name                                    | -         | width                         | mm        |
|            |             | loading_rate                                 | mm/s      | true_stress                   | MPa       |
|            |             | sample_radius                                | mm        | true_strain                   | -         |
|            |             | sample_height                                | mm        |                               |           |
|            |             | stiffness_modulus                            | MPa       |                               |           |
|            |             | compressive_strength                         | MPa       |                               |           |
|            |             |                                              |           |                               |           |
| fpit       | single-point| id                                           | -         | time                          | hh:mm:ss  |
|            |             | deposition_time                              | hh:mm:ss  | load                          | N         |
|            |             | deposition_end                               | hh:mm:ss  | age                           | hh:mm:ss  |
|            |             | testing_time                                 | hh:mm:ss  | depth                         | mm        |
|            |             | file_name                                    | -         |                               |           |
|            |             | loading_rate                                 | mm/s      |                               |           |
|            |             | indenter_radius                              | mm        |                               |           |
|            |             | sample_radius                                | mm        |                               |           |
|            |             | stiffness_modulus                            | MPa       |                               |           |
|            |             | compressive_strength                         | MPa       |                               |           |
|            |             | cohesion                                     | MPa       |                               |           |
|            |             | friction_angle                               | degrees   |                               |           |
|            |             |                                              |           |                               |           |
| vane       | single-point| id                                           | -         | n/a                           | n/a       |
|            |             | deposition_time_start                        | hh:mm:ss  |                               |           |
|            |             | deposition_end                               | hh:mm:ss  | age                           | hh:mm:ss  |
|            |             | testing_time                                 | hh:mm:ss  |                               |           |
|            |             | position_x                                   | mm        |                               |           |
|            |             | position_y                                   | mm        |                               |           |
|            |             | position_z                                   | mm        |                               |           |
|            |             | torque                                       | …         |                               |           |
|            |             | diameter                                     | …         |                               |           |
|            |             | height                                       | …         |                               |           |
|            |             | factor                                       | …         |                               |           |
|            |             | yield_stress                                 | …         |                               |           |
|            |             |                                              |           |                               |           |
| compressive_test |single-point | id                                     | …         |                               |           |
|            |             | deposition_time_start                        | hh:mm:ss  |                               |           |
|            |             | deposition_time_end                          | …         |                               |           |
|            |             | testing_day                                  | …         |                               |           |
|            |             | testing_time                                 | …         |                               |           |
|            |             | sample_diameter                              | …         |                               |           |
|            |             | sample_height                                | …         |                               |           |
|            |             | sample_mass                                  | …         |                               |           |
|            |             | loading_rate                                 | …         |                               |           |
|            |             | failure_load                                 | …         |                               |           |
|            |             | density                                      | …         |                               |           |
|            |             | strength                                     | …         |                               |           |
