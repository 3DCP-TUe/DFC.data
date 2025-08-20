%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

%GET_COMPONENTS_FROM_FOLDER Retrieves component names and folders from .yml files
%
%   [NAMES, FOLDERS] = get_components_from_folder(ROOT_FOLDER) searches
%   recursively in ROOT_FOLDER for .yml files and returns:
%       NAMES   - Folder names where each .yml file is found
%       FOLDERS - Full paths to those folders
%
%   Inputs:
%       ROOT_FOLDER  Path to the library folder containing component .yml files
%
%   Outputs:
%       NAMES        Cell array of folder names containing the .yml files
%       FOLDERS      Cell array of full paths to the folders
%
%   Example:
%       [names, folders] = get_components_from_folder('C:\lib\components')
%
%   This function is useful for locating component setupinfo files in a library
%   and retrieving both their folder names and full paths.
function [names, folders] = get_components_from_folder(root_folder)

    % Find all .yml files recursively
    files = dir(fullfile(root_folder, '**', '*.yml'));
    n = numel(files);

    % Preallocate cell arrays
    names = cell(n, 1);
    folders = cell(n, 1);

    for i = 1:n
        % Extract folder name and full path
        [~, name] = fileparts(files(i).folder);
        folders{i} = files(i).folder;
        names{i} = name;
    end
end
