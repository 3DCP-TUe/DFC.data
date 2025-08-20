%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

function [names, folders] = get_components_from_folder(root_folder)
    
    %GET_COMPONENTS_FROM_FOLDER Retrieves component names and folders from .yml files
    %   [names, folders] = get_components_from_folder(root_folder)
    %   Searches recursively in root_folder for .yml files and returns:
    %   - names: folder names where each .yml file is found
    %   - folders: full paths to those folders

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
