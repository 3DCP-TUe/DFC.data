# 3D Sneak Peek: 3DCP Database Framework TU/e

## Introduction 

This repository contains the template and setup information library for the 3D Sneak Peek database. The aim of this project is to collect experimental data about 3D concrete printing in a structured way and distribute this data to the community. This repository includes the system library of the equipment at TU/e and the templates for data records and software packages.

## Documentation

In the following README, the structure and more detailed information of the various parts of this project are provided. 

- [Data record](docs/data_record.md)
- [System data](docs/system_data.md)
- [In-line and on-line measurements](docs/inline_online_measurements.md)
- [In-situ and off-line measurements](docs/insitu_offline_measurements.md)
- [Software structure](docs/software.md)

## Explanation of the files

[**docs**](docs): ...

[**src**](src): ...
- [**src/analysis**](src/analysis): ...
- [**src/setupinfo**](src/setupinfo): ..
- [**src/template**](src/template): ...

[**utils**](utils): ...

## Version numbering

The 3D Sneak Peak project uses the following versioning scheme: 

```
0.x.x ---> MAJOR version: Incompatible changes; for example, restructuring the database format and metadata files.
x.0.x ---> MINOR version: Functionality added in a backward-compatible manner; for example, new system components.
x.x.0 ---> PATCH version: Small backward-compatible changes; for example, small corrections in a component property.
```

## Contact information

If you have any questions or comments about this project, please open an issue on the repository’s issue page. This can include questions about the content, such as missing information, and the data structure. We encourage you to open an issue instead of sending us emails to help establish an open community. By keeping discussions open, everyone can contribute and see the feedback and questions of others. In addition to this, please see our open science statement below.

## Open science statement

We are committed to the principles of open science to ensure that our work can be reproduced and built upon by others. Our approach includes the following key points:

- Reproducibility: We strive to make our work reproducible by sharing detailed methodologies and data.
- Unique Resources and Data: We have equipment and facilities that are not available at other institutes. We generate data that other institutes cannot produce, and we share this data openly.
- Data and Software Sharing: We share our data and software and encourage others to do the same. If others use our data and software, they must also share their software and data under similar terms.

To support these principles, we license our software under the General Public License version 3 or later (free to use, with attribution, share with source code) and our data and documentation under CC BY-SA (free to use, with attribution, share-alike). By adhering to these principles, we aim to encourage an open and collaborative scientific community. We expect that if you use our resources, you will do the same. 

## License

### Documentation

The documentation of 3D Sneak Peak is licensed under the [Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

Copyright (c) 2024-2025 [3D Concrete Printing Research Group at Eindhoven University of Technology](https://www.tue.nl/en/research/research-groups/structural-engineering-and-design/3d-concrete-printing)

You are free to:
- Share — copy and redistribute the material in any medium or format
- Adapt — remix, transform, and build upon the material for any purpose, even commercially.

Under the following terms:
- Attribution — You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
- ShareAlike — If you remix, transform, or build upon the material, you must distribute your contributions under the same license as the original.

No additional restrictions — You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

To view a copy of this license, visit <http://creativecommons.org/licenses/by-sa/4.0/>.

### Source code

The software components are licensed under the GNU General Public License version 3.0.

Copyright (c) 2024-2025 [3D Concrete Printing Research Group at Eindhoven University of Technology](https://www.tue.nl/en/research/research-groups/structural-engineering-and-design/3d-concrete-printing)

3D Sneak Peek contains free software; you can redistribute it and/or modify it under the terms of the GNU General Public License version 3.0 as published by the Free Software Foundation. 

The software components are distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with 3D Sneak Peek; If not, see <http://www.gnu.org/licenses/>.

@license GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.html>

### Readyaml

The [readyaml](src/analysis/readyaml.m) file to import YAML metadata into MATLAB is obtained via [Maarten Jongeneel](https://github.com/MaartenJongeneel/readyaml). 

BSD 3-Clause License

Copyright (c) 2023 Maarten Jongeneel

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
