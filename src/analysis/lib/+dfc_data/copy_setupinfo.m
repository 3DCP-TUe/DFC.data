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

function copy_setupinfo(root, destination, components, swipe_destination)
%COPY_SETUPINFO Copy setupinfo folders for specified components
%
%   copy_setupinfo(ROOT, DESTINATION, COMPONENTS, SWIPE_DESTINATION) copies
%   the setupinfo folders of the specified COMPONENTS from the library ROOT
%   to the DESTINATION folder.
%
%   Inputs:
%       ROOT                Path to the library containing setupinfo folders
%       DESTINATION         Target folder to copy setupinfo into
%       COMPONENTS          Cell array of component names to copy
%       SWIPE_DESTINATION   Logical flag; if true, clears DESTINATION before copying
%
%   Example:
%       copy_setupinfo('C:\lib', 'C:\project\setup', {'compA','compB'}, true)
%
%   This function will copy the folders for compA and compB from
%   'C:\lib' to 'C:\project\setup', deleting the target folder first if
%   SWIPE_DESTINATION is true.

%------------- BEGIN CODE --------------

    % Get all component names and their folders from the library
    [lib_names, lib_folders] = dfc_data.get_components_from_folder(root);

    % Match requested components to library components
    indices = zeros(size(components));
    for i = 1:length(components)
        idx = find(strcmp(lib_names, components{i}), 1);
        if ~isempty(idx)
            indices(i) = idx;
        end
    end

    % Check for missing components
    if any(indices == 0)
        missing = components(indices == 0);
        error('The following components were not found in the library: %s', ...
            strjoin(missing, ', '));
    end

    % Get folders for matched components
    folders_used = lib_folders(indices);

    % Optionally clear destination folder
    if swipe_destination
        if isfolder(destination)
            rmdir(destination, 's');
        end
    end

    % Ensure destination folder exists
    if ~isfolder(destination)
        mkdir(destination);
    end

    % Copy each component folder to the destination
    for k = 1:length(folders_used)
        source_folder = folders_used{k};
        [~, name] = fileparts(source_folder);
        destination_folder = fullfile(destination, name);

        [status, msg] = copyfile(source_folder, destination_folder);
        if ~status
            error('Failed to copy folder "%s" to "%s": %s', ...
                source_folder, destination_folder, msg);
        end
    end
end
