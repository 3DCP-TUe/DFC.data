# Compression test

## Description of the experiment

Compression tests are performed by placing a cylindrical specimen in a hydraulic press and measuring it's resistance according to EN 12390-3.

## Data collection

The maximum resistance is manually recorded in a csv file that follows the structure described below.

## Processed data file format

The `processed_data` folder contains at least the following files:

**`overview.csv`**

|Columns                        | Units      |
|-------------------------------|------------|
| deposition_date               | yyyy-MM-dd |
| deposition_time_start         | HH:mm:ss   |
| deposition_time_end           | HH:mm:ss   |
| testing_date                  | yyyy-MM-dd |
| testing_time_start            | HH:mm:ss   |
| sample_diameter               | mm         |
| sample_height                 | mm         |
| sample_mass                   | g          |
| loading_rate                  | kN/s       |
| density                       | kg/m³      |
| failure_load                  | kN         |
| compressive_strength          | MPa        |
