# Analysis

This folder contains files to perform analysis over a session and data record. The purpose is to store a collection of standard functions that act as a library. Store these files together with your dataset and adjust them if needed. If you add new functionality, please push these updates to the templates provided here so that others can also benefit from them.

## Explanation of the files

- **[sneakpeek.m](sneakpeek.m):** Provides a collection of functions for analyzing sessions and preparing data records. 
- **[readyaml.m](readyaml.m):** A MATLAB function for reading YAML files, originally developed by Maarten Jongeneel and distributed under the BSD-3 License.
- **[extract_setupinfo.m](extract_setupinfo.m):** Demonstrates how to extract component information from session metadata and copy the setup information of the used components to a destination folder (e.g., storing setup details of a data record).