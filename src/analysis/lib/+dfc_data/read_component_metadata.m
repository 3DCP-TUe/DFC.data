% SPDX-License-Identifier: GPL-3.0-or-later
% DFC.data
% Project: https://github.com/3DCP-TUe/DFC.data
%
% Copyright (c) 2024-2025 Eindhoven University of Technology
%
% Authors:
%   - Arjen Deetman (2024-2025)
%
% For license details, see the LICENSE file in the project root.

function result = read_system_component_metadata(folder, component)
%READ_SYSTEM_COMPONENT_METADATA Load metadata for a system component
%
% Syntax:
%   result = read_system_component_metadata(folder, component)
%
% Description:
%   Reads the YAML metadata file for the specified system COMPONENT stored
%   in FOLDER, and returns it as a MATLAB struct.
%
% Inputs:
%   folder    - Path to the directory containing component subfolders
%   component - Name of the component whose metadata should be loaded
%
% Outputs:
%   result    - Struct containing parsed YAML metadata of the component
%
% Notes:
%   - The function expects the file <folder>\<component>\metadata.yml to exist.
%   - Parsing is performed with dfc_data.readyaml.
%
% Example:
%   metadata = read_system_component_metadata('C:\lib', 'motorA');

%------------- BEGIN CODE --------------

    % Construct full path to the metadata file
    metadata_path = fullfile(folder, component, 'metadata.yml');

    % Check if the file exists
    if ~isfile(metadata_path)
        error('Metadata file not found for component "%s" at "%s".', ...
              component, metadata_path);
    end

    % Read and return the YAML content
    result = dfc_data.readyaml(metadata_path);
end
