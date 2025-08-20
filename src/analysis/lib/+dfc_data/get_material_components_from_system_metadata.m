%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

%GET_MATERIAL_COMPONENTS_FROM_SYSTEM_METADATA Extracts unique material components
%
%   COMPONENTS = get_material_components_from_system_metadata(METADATA) 
%   returns a list of unique material component names used in a session, 
%   based on the provided METADATA structure.
%
%   Inputs:
%       METADATA  Structure containing system layout information, typically 
%                 read from a session metadata file.
%
%   Outputs:
%       COMPONENTS  Cell array of unique material component names.
%
%   Example:
%       metadata = dfc_data.readyaml('session_metadata.yml');
%       components = get_material_components_from_system_metadata(metadata);
%
%   This function extracts the "component" field from each entry in 
%   METADATA.system_layout and returns the unique names.
function components = get_material_components_from_system_metadata(metadata)

    % Extract components from materials
    material_components = cellfun(@(x) x.component, metadata.system_layout, 'UniformOutput', false);

    % Return unique component names
    components = unique(material_components);
end
