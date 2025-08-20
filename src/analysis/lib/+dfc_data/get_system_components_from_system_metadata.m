%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

function components = get_system_components_from_system_metadata(metadata)

    %GET_SYSTEM_COMPONENTS_FROM_SYSTEM_METADATA Extracts unique components used in a session
    %   components = get_system_components_from_system_metadata(session)
    %   Returns a list of unique system component names used in the system layout
    %   and motion systems of the metadata structure.

    % Extract components from system layout
    layout_components = cellfun(@(x) x.component, metadata.system_layout, 'UniformOutput', false);

    % Extract names of motion systems
    motion_components = cellfun(@(x) x.name, metadata.motion_systems, 'UniformOutput', false);

    % Combine and return unique component names
    components = unique([layout_components; motion_components]);
end
