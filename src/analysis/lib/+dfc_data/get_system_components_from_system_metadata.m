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

function components = get_system_components_from_system_metadata(metadata)
%GET_SYSTEM_COMPONENTS_FROM_SYSTEM_METADATA Extracts unique system components
%
%   COMPONENTS = get_system_components_from_system_metadata(METADATA)
%   returns a list of unique system component names used in a session, 
%   based on the provided METADATA structure. This includes components 
%   from both the system layout and motion systems.
%
%   Inputs:
%       METADATA  Structure containing system layout and motion systems 
%                 information, typically read from a session metadata file.
%
%   Outputs:
%       COMPONENTS  Cell array of unique system component names.
%
%   Example:
%       metadata = dfc_data.readyaml('session_metadata.yml');
%       components = get_system_components_from_system_metadata(metadata);
%
%   This function extracts the "component" field from METADATA.system_layout 
%   and the "name" field from METADATA.motion_systems, then returns the 
%   unique names.

%------------- BEGIN CODE --------------

    % Extract components from system layout
    layout_components = cellfun(@(x) x.component, metadata.system_layout, 'UniformOutput', false);

    % Extract names of motion systems
    motion_components = cellfun(@(x) x.name, metadata.motion_systems, 'UniformOutput', false);

    % Combine and return unique component names
    components = unique([layout_components; motion_components]);
end
