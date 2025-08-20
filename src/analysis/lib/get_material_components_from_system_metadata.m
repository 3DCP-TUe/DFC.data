%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

function components = get_material_components_from_system_metadata(metadata)

    %GET_MATERIAL_COMPONENTS_FROM_SYSTEM_METADATA Extracts unique components used in a session
    %   components = get_material_components_from_system_metadata(session)
    %   Returns a list of unique materials component names used of the metadata structure.

    % Extract components from materials
    material_components = cellfun(@(x) x.component, metadata.system_layout, 'UniformOutput', false);

    % Return unique component names
    components = unique(material_components);
end
