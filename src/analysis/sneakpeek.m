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
        
        % % Fills the session system_data setupinfo folder of all sessions
        function fill_record_setupinfo(library, folder, swipe_destination)
            
            % Check if folder is a struct (from dir) or a string/char
            if isstruct(folder)
                % Extract folder path from the struct
                path = folder(1).folder;  % Assuming the first entry is relevant
            elseif ischar(folder) || isstring(folder)
                % If it's already a string or character array, use it directly
                path = folder;
            else
                error('Invalid input: folder must be a string, char array, or a dir struct.');
            end

            % Check if folder exists
            if ~isfolder(path)
                error('Data record folder does not exists.');
            end

            % Get a list of all subfolders in the root directory
            subfolders = dir(path);
            
            for i = 1:length(subfolders)
                
                % Check if the folder name contains 'session'
                if subfolders(i).isdir && contains(subfolders(i).name, ...
                        'session')

                    % Fill session setupinfo folder
                    sneakpeek.fill_session_setupinfo(library, ...
                        subfolders(i), swipe_destination)
                end
            end
        end
        
        % -----------------------------------------------------------------

        % Fills the session system_data setupinfo folder
        function fill_session_setupinfo(library, folder, swipe_destination)
            
            % Check if folder is a struct (from dir) or a string/char
            if isstruct(folder)
                % Extract folder path from the struct
                path = fullfile(folder.folder, folder.name);
            elseif ischar(folder) || isstring(folder)
                % If it's already a string or character array, use it directly
                path = folder;
            else
                error('Invalid input: folder must be a string, char array, or a dir struct.');
            end

            % Construct the full path to the metadata file
            metadata_file = fullfile(path, 'metadata_session.yml');
    
            % Check if the metadata file exists
            if isfile(metadata_file)
                
                % Read the YAML file
                session = readyaml(metadata_file);
                
                % Extract components from the session metadata
                components = sneakpeek.get_components_from_session(session);
                
                % Set destination
                destination = path + "\system_data\setupinfo\";
            
                % Copy used components to destination folder
                sneakpeek.copy_setupinfo(library, destination, ...
                    components, swipe_destination);

            else
                file_info = dir(metadata_file);
                if isempty(file_info)
                    error('Session does not contain a metadata file.');
                else
                    error('Session %s does not contain a metadata file.', file_info.folder);
                end
            end
        end

        % -----------------------------------------------------------------
        
        % Copies setupinfo from a library (root) to a setupinfo 
        % (destination folder) for a given list of components
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

        function [graph, fig] = get_system_ontology(session)

            % Initialize
            nodes = {}; % List of component names
            edges = []; % Stores connections
            weights = []; % Used to categorize nodes and edges
            component_map = containers.Map(); % Map components to indices
            
            % Collect all components
            for i = 1:length(session.system_layout)
                component_name = session.system_layout{i}.component;
                if ~isKey(component_map, component_name)
                    component_map(component_name) = length(nodes) + 1;
                    nodes{end+1} = component_name;
                end
            end
            
            % Add materials as nodes
            for i = 1:length(session.materials)
                component_name = session.materials{i}.name;
                if ~isKey(component_map, component_name)
                    component_map(component_name) = length(nodes) + 1;
                    nodes{end+1} = component_name;
                end
            end
            
            % Collect edges
            for i = 1:length(session.system_layout)
                if isfield(session.system_layout{i}, 'connected_to')
                    
                    source_idx = component_map(session.system_layout{i}.component);
                    
                    for j = 1:length(session.system_layout{i}.connected_to)
                        target_component = session.system_layout{i}.connected_to{j}.component;
                        
                        % Ensure target component is in the map
                        if ~isKey(component_map, target_component)
                            component_map(target_component) = length(nodes) + 1;
                            nodes{end+1} = target_component;
                        end
                        
                        target_idx = component_map(target_component);
                        edges = [edges; source_idx, target_idx];
                        weights = [weights; 0];
                    end
            
                elseif isfield(session.system_layout{i}, 'inserted_in')
                    
                    source_idx = component_map(session.system_layout{i}.component);
                    target_component = session.system_layout{i}.inserted_in;
                    
                    % Ensure target component is in the map
                    if ~isKey(component_map, target_component)
                        component_map(target_component) = length(nodes) + 1;
                        nodes{end+1} = target_component;
                    end
                    
                    target_idx = component_map(target_component);
                    edges = [edges; source_idx, target_idx];
                    weights = [weights; 1];
                end
            end
            
            % Process io configuration and add connections
            for i = 1:length(session.io_configuration)
            
                source_idx = component_map(session.io_configuration{i}.component);
            
                for j = 1:length(session.io_configuration{i}.channels)
                    
                    target_component = session.io_configuration{i}.channels{j}.component;
                    
                    % Ensure the target component is already in the map
                    if isKey(component_map, target_component)
                        target_idx = component_map(target_component);
                        edges = [edges; target_idx, source_idx];
                        weights = [weights; 2];
                    end
                end
            end
            
            % Process materials and add connections
            for i = 1:length(session.materials)
            
                source_idx = component_map(session.materials{i}.name);
                target_component = session.materials{i}.supplied_to;
                
                % Ensure the target component is already in the map
                if isKey(component_map, target_component)
                    target_idx = component_map(target_component);
                    edges = [edges; source_idx, target_idx];
                    weights = [weights; 3];
                end
            end
            
            % Add io connection material delivery plc and environment
            % temperature-humidity sensor-1 if used (hard-wired)
            %{
            source_idx = find(strcmp(nodes, 'material delivery plc'));
            target_idx = find(strcmp(nodes, 'environment temperature-humidity sensor-1'));
            
            if ~isempty(source_idx) &  ~isempty(target_idx)
                edges = [edges; target_idx, source_idx];
                weights = [weights; 2];
            end
            %}
            
            % Create and plot the graph
            graph = digraph(edges(:,1), edges(:,2), weights, nodes);
            
            % Set edge colors based on weights
            edge_colors= [];
            line_width = [];
            
            for i = 1:length(graph.Edges.Weight)
                
                if graph.Edges.Weight(i) == 0 % Concrete flow
                    color = [0, 0, 0];
                    width = 3;
                elseif graph.Edges.Weight(i) == 1 % Insert
                    color = [0, 0, 1];
                    width = 2;
                elseif graph.Edges.Weight(i) == 3 % Material
                    color = [0, 1, 0];
                    width = 2;
                else % IO
                    color = [1, 0, 0];
                    width = 2;
                end
            
                edge_colors= [edge_colors; color];
                line_width = [line_width; width];
            end
            
            % Node colors
            node_colors = zeros(numnodes(graph), 3);
            % Inserts
            idx = graph.Edges.Weight == 1;
            nodes = graph.Edges.EndNodes(idx, :);
            idx = find(ismember(graph.Nodes.Name, unique(nodes(:))));
            node_colors(idx,:) = repmat([0, 0, 1], length(idx), 1);
            % IO
            idx = graph.Edges.Weight == 2;
            nodes = graph.Edges.EndNodes(idx, :);
            idx = find(ismember(graph.Nodes.Name, unique(nodes(:))));
            node_colors(idx,:) = repmat([1, 0, 0], length(idx), 1);
            % Material
            idx = graph.Edges.Weight == 3;
            nodes = graph.Edges.EndNodes(idx, :);
            idx = find(ismember(graph.Nodes.Name, unique(nodes(:))));
            node_colors(idx,:) = repmat([0, 1, 0], length(idx), 1);
            % Concrete flow
            idx = graph.Edges.Weight == 0;
            nodes = graph.Edges.EndNodes(idx, :);
            idx = find(ismember(graph.Nodes.Name, unique(nodes(:))));
            node_colors(idx,:) = repmat([0, 0, 0], length(idx), 1);
            
            % Plot the ontology graph
            fig = figure;
            box on
            hold on
            set(gca, 'FontSize', 24);
            set(gca,'YColor',[0,0,0])
            set(gca,'XColor',[0,0,0])
            set(gcf, 'PaperUnits', 'inches');
            set(gcf, 'Units', 'inches');
            fig_width = 4^(3/2);
            fig_height = 3^(3/2); 
            set(gcf, 'PaperPosition', [0 0 fig_width fig_height]); 
            set(gcf, 'PaperSize', [fig_width fig_height]); 
            set(gcf, 'Position', [1 1 fig_width, fig_height]);
            xticks([-9999 9999])
            yticks([-9999 9999])
            plot(graph, 'Layout', 'force', ...
                'NodeColor', node_colors, ...
                'MarkerSize', 6, ...
                'EdgeColor', edge_colors, ...
                'LineWidth', line_width);

        end
        
        % -----------------------------------------------------------------
            
        function result = read_component_metadata( ...
                setupinfo_folder, component)

            result = readyaml(setupinfo_folder + "\" + component + ...
                "\metadata.yml");
        end

        % -----------------------------------------------------------------
        
        function rename_files(folder, suffix)
        
            % Get a list of all files and directories in the folder
            files = dir(fullfile(folder, '*.*')); 

            % Remove directories from the list
            files = files(~[files.isdir]);
            
            % Sort files alphabetically
            [~, idx] = sort({files.name});
            files = files(idx);
        
            % Rename files sequentially
            for i = 1:numel(files)
                old_name = fullfile(folder, files(i).name);
                
                % Keep the original file extension
                [~, ~, ext] = fileparts(files(i).name);
                new_name = fullfile(folder, sprintf('%s_%d%s', ...
                    suffix, i, ext));
                
                % Rename only if the names are different
                if ~strcmp(old_name, new_name)
                    movefile(old_name, new_name);
                end
            end
        end

        % -----------------------------------------------------------------

        function remove_files_by_extension(folder, extension)
            
            % Ensure the extension starts with a dot
            if extension(1) ~= '.'
                extension = ['.', extension];
            end
        
            % Get a list of all files and subfolders in the folder
            items = dir(folder);
            files_to_delete = {}; % Store files to be deleted
            
            % Loop through each item
            for i = 1:numel(items)
                % Get full path of the item
                item_path = fullfile(folder, items(i).name);
                
                % Skip '.' and '..' directories
                if strcmp(items(i).name, '.') || strcmp(items(i).name, '..')
                    continue;
                end
                
                % If it's a folder, recursively call the function
                if items(i).isdir
                    sneakpeek.remove_files_by_extension(item_path, extension);
                else
                    % Check if the file has the specified extension
                    [~, ~, ext] = fileparts(items(i).name);
                    if strcmp(ext, extension)
                        files_to_delete{end+1} = item_path; %#ok<AGROW>
                    end
                end
            end
            
            % If files to delete exist, ask for confirmation
            if ~isempty(files_to_delete)
                message = sprintf('Folder: %s\nAre you sure you want to delete %d files with extension "%s"?', ...
                          folder, numel(files_to_delete), extension);
                choice = questdlg(message, 'Confirm Deletion', 'Yes', 'No', 'No');
                
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
        
        % -----------------------------------------------------------------

    end
end