% SPDX-License-Identifier: GPL-3.0-or-later
% DFC.data
% Project: https://github.com/3DCP-TUe/DFC.data
%
% Copyright (c) 2024-2025 Endhoven University of Technology
%
% Authors:
%   - Arjen Deetman (2024-2025)
%
% For license details, see the LICENSE file in the project root.

function result = read_system_component_metadata(folder, component)
%READ_SYSTEM_COMPONENT_METADATA Loads metadata for a specific component
%
%   RESULT = read_system_component_metadata(FOLDER, COMPONENT) reads the 
%   YAML metadata file for a specified COMPONENT stored in FOLDER and 
%   returns it as a MATLAB struct.
%
%   Inputs:
%       FOLDER      Path to the directory containing component folders
%       COMPONENT   Name of the component whose metadata is to be loaded
%
%   Outputs:
%       RESULT      Struct containing parsed YAML metadata of the component
%
%   Example:
%       metadata = read_system_component_metadata('C:\lib', 'motorA');
%
%   This function will read 'C:\lib\motorA\metadata.yml' and parse its
%   contents into a MATLAB struct.

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
