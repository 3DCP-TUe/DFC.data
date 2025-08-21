# Tracer experiments

Data source folder: `tracer_experiment`

## Description of the experiment

Tracer experiments are used to analyze material flow within the system. In this experiment, a dye or pigment is injected at a specific location into the system, and digital image processing (DIP) is used to detect its presence at the nozzle outlet. By correlating the color intensity of the material from the images to the tracer concentration, the residence time functions can be determined. From impulse inputs, the residence time distribution is obtained, while step-up and step-down inputs provide the cumulative residence function and wash-out function, respectively. The experiment can be performed both in-line and on-line, though on-line measurements are more practical, as in-line implementation would require the camera to rotate with the nozzle to follow the printing trajectory. The experiment is described in detail in [Deetman et al. (2024)](https://doi.org/10.1617/s11527-024-02378-y)

## Data collection

For this experiment, the software package [Concrete Candy Tracker](https://github.com/3DCP-TUe/ConcreteCandyTracker) was developed. Concrete Candy Tracker is developed in Python and built around pypylon, the official Python wrapper for Basler cameras. It calculates mean color values (RGB, CIELAB, and CIEXYZ) in real-time within a specified region of interest at a frequency of 10 to 60 Hz, depending on camera settings. The software includes functionality for writing measured color values to an external or local OPC UA server, enabling real-time visualization and interaction on a Node-RED dashboard with the system data. 

The __raw data__ contains a log file providing time-series data of the measured color values. Additionally, short measurements on grey and white cards used for color calibration can be stored. The __setupinfo__ folder contains a YAML metadata file describing the hardware and software settings. The hardware described includes the camera, lens, filters, and lighting, while the software settings include, among others, the white balance ratios, gain level, and exposure time. The __processed data__ consists of a time series table with the color values but with outliers removed. Additionally, for each experiment, a separate file is stored that contains, depending on how the tracer material was applied, the residence time distribution, step-up response, or step-down response in a time series format. An overview file is provided, listing the experiments with details such as start time, end time, input type used, and a reference to the individual experiment file. The __scripts__ folder contains the files used to produce the files in the processed data folder from the raw data. 

## Processed data file format

The `processed_data` folder contains the following files:

---

**`color_values.csv`** contains color measurement data over time.

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

**`overview.csv`** contains metadata and statistical summaries for each tracer experiment.

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
