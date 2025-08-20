%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

function result = read_system_component_metadata(folder, component)
    
    %READ_COMPONENT_METADATA Loads metadata for a specific component
    %   result = read_component_metadata(folder, component)
    %   - folder: path to the directory the component is stored
    %   - component: name of the component
    %   - result: parsed YAML metadata as a struct

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
