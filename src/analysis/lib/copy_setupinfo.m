%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

function copy_setupinfo(root, destination, components, swipe_destination)

    %COPY_SETUPINFO Copies setupinfo folders for specified components
    %   copy_setupinfo(root, destination, components, swipe_destination)
    %   - root: path to the library containing setupinfo folders
    %   - destination: target folder to copy setupinfo into
    %   - components: cell array of component names to copy
    %   - swipe_destination: if true, clears destination before copying

    % Get all component names and their folders from the library
    [lib_names, lib_folders] = get_components_from_folder(root);

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
