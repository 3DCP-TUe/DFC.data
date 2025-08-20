%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

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
function result = read_system_component_metadata(folder, component)
    
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
