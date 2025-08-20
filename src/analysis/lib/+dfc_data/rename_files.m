%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

%RENAME_FILES Renames all files in a folder with a sequential suffix
%
%   rename_files(FOLDER, SUFFIX) renames all files in the specified FOLDER
%   by appending a sequential number to the given SUFFIX while preserving
%   the original file extensions.
%
%   Inputs:
%       FOLDER  Path to the folder containing files
%       SUFFIX  Prefix to use for renamed files
%
%   Example:
%       rename_files('C:\project\data', 'image')
%
%   This will rename all files in 'C:\project\data' as:
%       image_1.ext, image_2.ext, image_3.ext, ...
%   where '.ext' is the original file extension.
function rename_files(folder, suffix)

    % Get all files (excluding directories)
    files = dir(fullfile(folder, '*.*'));
    files = files(~[files.isdir]);

    % Sort files alphabetically
    [~, idx] = sort({files.name});
    files = files(idx);

    % Rename files sequentially
    for i = 1:numel(files)
        old_name = fullfile(folder, files(i).name);

        % Preserve original extension
        [~, ~, ext] = fileparts(files(i).name);
        new_name = fullfile(folder, sprintf('%s_%d%s', suffix, i, ext));

        % Rename if different
        if ~strcmp(old_name, new_name)
            movefile(old_name, new_name);
        end
    end
end
