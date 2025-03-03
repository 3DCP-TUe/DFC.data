%{
This file is part of 3D Sneak Peek. 3D Sneak Peek code is licensed under 
the terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/3DSneakPeek>.
%}

classdef sneakpeek
    methods(Static)

        % -----------------------------------------------------------------
        
        % Gets all the components from a setupinfo folder (from a library 
        % or data record)
        function [names, folders] = ...
            get_components_from_setupinfo(root_folder)
            files = dir(fullfile(root_folder, '**', '*.yml'));
            n = length(files);
            names = cell(n, 1);
            folders = cell(n, 1);
            
            for i = 1:n
                [~, name, ~] = fileparts(files(i).folder);
                folders{i} = files(i).folder;
                names{i} = name;
            end
        end

        % -----------------------------------------------------------------

        % Gets the components used in a session
        function components = get_components_from_session(session)
            
            % Get components from layout
            n = length(session.system_layout);
            components = cell(n, 1);
            
            for i = 1:n
                components{i} = session.system_layout{i}.component;
            end

            % Add used motion system
            n = length(session.motion_systems);
            motion_systems = cell(n, 1);

            for i = 1:n
                motion_systems{i} = session.motion_systems{i}.name;
            end

            % Return unique components
            components = unique([components; motion_systems]);
        end

        % -----------------------------------------------------------------

        function components = get_components_from_data_record(root_folder)
    
            % Get a list of all subfolders in the root directory
            subfolders = dir(root_folder);
            components = {};
            
            for i = 1:length(subfolders)
                
                % Check if the folder name contains 'session'
                if subfolders(i).isdir && contains(subfolders(i).name, ...
                        'session')
                   
                    % Construct the full path to the metadata file
                    metadata_file = fullfile(root_folder, ...
                        subfolders(i).name, 'metadata_session.yml');
                    
                    % Check if the metadata file exists
                    if isfile(metadata_file)
                        
                        % Read the YAML file
                        session = readyaml(metadata_file);
                        
                        % Extract components from the session metadata
                        session_components = ...
                            sneakpeek.get_components_from_session(session);
                        
                        % Append to the list
                        components = [components; session_components];
                    else
                        error(['Session %s does not contain a ' ...
                            'metadata file.'], subfolders(i).name);
                    end
                end
            end
    
            % Return unique components
            components = unique(components);
        end
               
        % -----------------------------------------------------------------

        % Copies setupinfo from a library (root) to a record (destination 
        % folder) for a given list of components
        function copy_setupinfo(root, destination, components, ...
                swipe_destination)
            
            % Get names and folders from root
            [lib_names, lib_folders] = ...
                sneakpeek.get_components_from_setupinfo(root);

            % Check if members exists
            indices = zeros(size(components));

            for i = 1:length(components)
                idx = find(strcmp(lib_names, components{i}));
                if ~isempty(idx)
                    indices(i) = idx;
                end
            end

            % Check for missing members
            if any(indices == 0)
                missing = components(indices == 0);
                error('The following components were not found: %s', ...
                    strjoin(missing, ', '));
            end
            
            % List the paths of hte component folders used
            folders_used = lib_folders(indices);

            % Swipe directory
            if swipe_destination == true
                if isfolder(destination)
                    rmdir(destination, 's');
                end
            end
            
            % Make directory
            if isfolder(destination)
                mkdir(destination);
            end
            
            % Loop through each folder path in cell array
            for k = 1:length(folders_used)
            
                source_folder = folders_used{k};  
                [~, name, ~] = fileparts(source_folder);
                destination_folder = fullfile(destination, name);
            
                % Copy the folder and its entire contents recursively
                [status, msg, ~] = copyfile(source_folder, ...
                    destination_folder);
            
                if ~status
                    error('Failed to copy folder "%s" to "%s": %s', ...
                        srcFolder, destFolder, msg);
                end
            end
        end
        
        % -----------------------------------------------------------------
            
        function result = read_component_metadata( ...
                setupinfo_folder, component)
            cd(setupinfo_folder);
            cd(component);
            result = readyaml(setupinfo_folder + "\" + component + ...
                "\metadata.yml");
        end

        % -----------------------------------------------------------------

        
    end
end