%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

function fill_session_system_data_components(library, folder, subfolder, swipe_destination)

    %FILL_SESSION_SYSTEM_DATA_COMPONENTS Populates system or material components folder
    %   fill_session_system_data_components(library, folder, subfolder, swipe_destination)
    %   - library: source of component setupinfo
    %   - folder: session folder (string or dir struct)
    %   - subfolder: either "system" or "materials"
    %   - swipe_destination: true to clear destination before copying

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
