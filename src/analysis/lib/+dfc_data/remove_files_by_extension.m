%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

%REMOVE_FILES_BY_EXTENSION Recursively deletes files with a given extension
%
%   remove_files_by_extension(FOLDER, EXTENSION) searches recursively in 
%   FOLDER for files matching the specified EXTENSION and deletes them after 
%   user confirmation.
%
%   Inputs:
%       FOLDER      Root folder to start searching
%       EXTENSION   File extension to delete (e.g., '.txt' or 'txt')
%
%   Example:
%       remove_files_by_extension('C:\project\data', '.log')
%
%   This function will prompt the user before deleting all '.log' files 
%   under 'C:\project\data' and its subfolders. If confirmed, the files 
%   will be deleted, otherwise no action is taken.
function remove_files_by_extension(folder, extension)

    % Ensure extension starts with a dot
    if extension(1) ~= '.'
        extension = ['.', extension];
    end

    % Get all items in the folder
    items = dir(folder);
    files_to_delete = {};

    for i = 1:numel(items)
        name = items(i).name;
        item_path = fullfile(folder, name);

        % Skip '.' and '..'
        if strcmp(name, '.') || strcmp(name, '..')
            continue;
        end

        if items(i).isdir
            % Recurse into subfolder
            dfc_data.remove_files_by_extension(item_path, extension);
        else
            % Check extension
            [~, ~, ext] = fileparts(name);
            if strcmpi(ext, extension)
                files_to_delete{end+1} = item_path; %#ok<AGROW>
            end
        end
    end

    % Confirm deletion
    if ~isempty(files_to_delete)
        msg = sprintf('Folder: %s\nDelete %d file(s) with extension "%s"?', ...
                      folder, numel(files_to_delete), extension);
        choice = questdlg(msg, 'Confirm Deletion', 'Yes', 'No', 'No');

        if strcmp(choice, 'Yes')
            for i = 1:numel(files_to_delete)
                delete(files_to_delete{i});
                fprintf('Deleted: %s\n', files_to_delete{i});
            end
            disp('Deletion completed.');
        else
            disp('Deletion canceled.');
        end
    else
        disp('No files found to delete.');
    end
end
