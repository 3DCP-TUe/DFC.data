# Tracer experiments

## Description of the experiment

## Processed data files

The `processed_data` folder contains the following files:

---

**`color_values.csv`**

Contains color measurement data over time.

| Column     | Description                                      |
|------------|--------------------------------------------------|
| `time`     | Clock time in HH:mm:ss format                    |
| `R`        | Red value (RGB color space)                      |
| `G`        | Green value (RGB color space)                    |
| `B`        | Blue value (RGB color space)                     |
| `X`        | X value (CIE 1931 XYZ color space)               |
| `Y`        | Y value (CIE 1931 XYZ color space)               |
| `Z`        | Z value (CIE 1931 XYZ color space)               |
| `L`        | L* value (CIELAB color space)                    |
| `a`        | a* value (CIELAB color space)                    |
| `b`        | b* value (CIELAB color space)                    |

---

**`overview.csv`**

Contains metadata and statistical summaries for each tracer experiment.

| Column       | Description                                                                 |
|--------------|-----------------------------------------------------------------------------|
| `experiment` | Identifier for the experiment number                                        |
| `serie`      | Series number the experiment belongs to                                     |
| `input`      | Input type: `impulse`, `step_up`, or `step_down`                            |
| `component`  | System component where tracer was added (must match system setup info)      |
| `inlet`      | Inlet of the component (must match system setup info)                       |
| `time_start` | Start time of experiment (HH:mm:ss), when material was injected             |
| `time_end`   | End time of experiment (HH:mm:ss)                                           |
| `file_name`  | Filename containing the response data                                       |
| `mean`       | Mean residence time (HH:mm:ss)                                              |
| `variance`   | Variance of the residence time (HH:mm:ss)                                   |
| `std`        | Standard deviation of the residence time (HH:mm:ss)                         |
| `p1`         | 1st percentile of the residence time (HH:mm:ss)                             |
| `p5`         | 5th percentile of the residence time (HH:mm:ss)                             |
| `p50`        | 50th percentile (median) of the residence time (HH:mm:ss)                   |
| `p95`        | 95th percentile of the residence time (HH:mm:ss)                            |
| `p99`        | 99th percentile of the residence time (HH:mm:ss)                            |

---

**File containing the response data**

Each experiment has a corresponding CSV file containing the response values over time.

| Column         | Description                                                              |
|----------------|--------------------------------------------------------------------------|
| `time`         | Clock time in HH:mm:ss format                                            |
| `time_response`| Time since start of experiment, starting from 00:00:00 (HH:mm:ss)        |
| `value`        | Normalized response value                                                |
| `R`            | Red value (RGB color space)                                              |
| `G`            | Green value (RGB color space)                                            |
| `B`            | Blue value (RGB color space)                                             |
| `X`            | X value (CIE 1931 XYZ color space)                                       |
| `Y`            | Y value (CIE 1931 XYZ color space)                                       |
| `Z`            | Z value (CIE 1931 XYZ color space)                                       |
| `L`            | L* value (CIELAB color space)                                            |
| `a`            | a* value (CIELAB color space)                                            |
| `b`            | b* value (CIELAB color space)                                            |