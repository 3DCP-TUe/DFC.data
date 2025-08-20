%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

function fill_record_system_data_components(library, folder, subfolder, swipe_destination)
    
    %FILL_RECORD_SYSTEM_DATA_COMPONENTS Fills setupinfo system components folders for all session subfolders
    %   fill_record_system_data_components(library, folder, swipe_destination)
    %   - library: component library
    %   - folder: path to the data record folder or a struct from dir
    %   - subfolder: either "system" or "materials"
    %   - swipe_destination: destination for setupinfo data

    % Determine the folder path
    if isstruct(folder)
        path = folder(1).folder;  % Use first entry's folder
    elseif ischar(folder) || isstring(folder)
        path = char(folder);      % Convert to char if needed
    else
        error('Invalid input: folder must be a string, char array, or a dir struct.');
    end

    % Validate folder existence
    if ~isfolder(path)
        error('Data record folder does not exist: %s', path);
    end
    
    % Get all subfolders
    subfolders = dir(path);
    for i = 1:length(subfolders)
        name = subfolders(i).name;
        full_path = fullfile(path, name);

        % Check for session folders
        if subfolders(i).isdir && contains(name, 'session')
            fill_session_system_data_components(library, full_path, subfolder, swipe_destination);
        end
    end
end
