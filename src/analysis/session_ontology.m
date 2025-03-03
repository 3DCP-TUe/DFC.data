%{
This file is part of 3D Sneak Peek. 3D Sneak Peek code is licensed under 
the terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/3DSneakPeek>.
%}

%% Clear and close
close all; 
clear;
clc;

%% Get file path
path = mfilename('fullpath');
[filepath, name, ext] = fileparts(path);
cd(filepath);

%% Import session

% Folder path to setupinfo of data record (destination)
cd(filepath);
cd('test/setupinfo')
setupinfo = pwd;

% Read session metadata file
cd(filepath);
cd('../template/yyyymmdd_session_3/')
session = readyaml(pwd + "\metadata_session.yml");


%% Get session data

% Initialize
nodes = {}; % List of component names
edges = [];       % Stores connections
weights = [];
component_map = containers.Map(); % Map components to indices

% Collect all components
for i = 1:length(session.system_layout)
    component_name = session.system_layout{i}.component;
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
% Concrete flow
idx = graph.Edges.Weight == 0;
nodes = graph.Edges.EndNodes(idx, :);
idx = find(ismember(graph.Nodes.Name, unique(nodes(:))));
node_colors(idx,:) = repmat([0, 0, 0], length(idx), 1);

% Plot the ontology graph
figure;
box off
plot(graph, 'Layout', 'force', 'NodeColor', node_colors, 'MarkerSize', 6, 'EdgeColor', edge_colors, 'LineWidth', line_width, 'ArrowSize', 0);


%% End
disp('End')