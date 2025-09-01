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

function fill_session_system_data_components(library, folder, subfolder, swipe_destination)
%FILL_SESSION_SYSTEM_DATA_COMPONENTS Populates system or material components folder
%
%   fill_session_system_data_components(LIBRARY, FOLDER, SUBFOLDER, SWIPE_DESTINATION)
%   copies the relevant setupinfo components from the LIBRARY into the session
%   folder FOLDER. The components copied depend on SUBFOLDER, which can be
%   either "system" or "materials".
%
%   Inputs:
%       LIBRARY             Source of component setupinfo
%       FOLDER              Session folder (string, char array, or dir struct)
%       SUBFOLDER           Either "system" or "materials"
%       SWIPE_DESTINATION   Logical flag; if true, clears destination before copying
%
%   Example:
%       fill_session_system_data_components('C:\lib', 'C:\records\session1', 'system', true)
%
%   This function reads the metadata file in the session folder to determine
%   which components to copy, then populates the appropriate system or material
%   components folder.

%------------- BEGIN CODE --------------

    % Resolve folder path
    if isstruct(folder)
        path = fullfile(folder.folder, folder.name);
    elseif ischar(folder) || isstring(folder)
        path = char(folder);
    else
        error('Invalid input: folder must be a string, char array, or a dir struct.');
    end

    % Construct metadata file path
    metadata_file = fullfile(path, 'system_data', 'setupinfo', 'metadata.yml');

    % Check for metadata file
    if ~isfile(metadata_file)
        error('System data folder "%s" does not contain a metadata file.', path);
    end

    % Read system metadata
    metadata = dfc_data.readyaml(metadata_file);

    % Extract components based on subfolder type
    switch lower(subfolder)
        case "system"
            components = dfc_data.get_system_components_from_system_metadata(metadata);
            destination = fullfile(path, 'system_data', 'setupinfo', 'system_components');
        case "materials"
            components = dfc_data.get_material_components_from_system_metadata(metadata);
            destination = fullfile(path, 'system_data', 'setupinfo', 'material_components');
        otherwise
            error('Invalid input: subfolder must be "system" or "materials".');
    end

    % Copy setupinfo for used components
    dfc_data.copy_setupinfo(library, destination, components, swipe_destination);
end
