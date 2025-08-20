%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

function [graph, fig] = get_system_ontology(metadata)

    %GET_SYSTEM_ONTOLOGY Constructs and visualizes a system ontology graph
    %   [graph, fig] = get_system_ontology(metadata)
    %   - metadata: metadata struct containing system_layout, materials, io_configuration
    %   - graph: MATLAB digraph object
    %   - fig: figure handle of the plotted graph

    % Initialize containers
    nodes = {};
    edges = [];
    weights = [];
    component_map = containers.Map();

    % Add components from system layout
    for i = 1:numel(metadata.system_layout)
        name = metadata.system_layout{i}.component;
        if ~isKey(component_map, name)
            component_map(name) = numel(nodes) + 1;
            nodes{end+1} = name;
        end
    end

    % Add materials
    for i = 1:numel(metadata.materials)
        name = metadata.materials{i}.name;
        if ~isKey(component_map, name)
            component_map(name) = numel(nodes) + 1;
            nodes{end+1} = name;
        end
    end

    % Add edges from system layout
    for i = 1:numel(metadata.system_layout)
        src = metadata.system_layout{i}.component;
        src_idx = component_map(src);

        if isfield(metadata.system_layout{i}, 'connected_to')
            for j = 1:numel(metadata.system_layout{i}.connected_to)
                tgt = metadata.system_layout{i}.connected_to{j}.component;
                if ~isKey(component_map, tgt)
                    component_map(tgt) = numel(nodes) + 1;
                    nodes{end+1} = tgt;
                end
                tgt_idx = component_map(tgt);
                edges(end+1,:) = [src_idx, tgt_idx];
                weights(end+1) = 0; % Concrete flow
            end
        elseif isfield(metadata.system_layout{i}, 'inserted_in')
            tgt = metadata.system_layout{i}.inserted_in;
            if ~isKey(component_map, tgt)
                component_map(tgt) = numel(nodes) + 1;
                nodes{end+1} = tgt;
            end
            tgt_idx = component_map(tgt);
            edges(end+1,:) = [src_idx, tgt_idx];
            weights(end+1) = 1; % Insert
        end
    end

    % Add IO configuration edges
    for i = 1:numel(metadata.io_configuration)
        src = metadata.io_configuration{i}.component;
        if isKey(component_map, src)
            src_idx = component_map(src);
            for j = 1:numel(metadata.io_configuration{i}.channels)
                tgt = metadata.io_configuration{i}.channels{j}.component;
                if isKey(component_map, tgt)
                    tgt_idx = component_map(tgt);
                    edges(end+1,:) = [tgt_idx, src_idx];
                    weights(end+1) = 2; % IO
                end
            end
        end
    end

    % Add material supply edges
    for i = 1:numel(metadata.materials)
        src = metadata.materials{i}.name;
        tgt = metadata.materials{i}.supplied_to;
        if isKey(component_map, tgt)
            src_idx = component_map(src);
            tgt_idx = component_map(tgt);
            edges(end+1,:) = [src_idx, tgt_idx];
            weights(end+1) = 3; % Material
        end
    end

    % Create graph
    graph = digraph(edges(:,1), edges(:,2), weights, nodes);

    % Edge styling
    edge_colors = zeros(numedges(graph), 3);
    line_widths = zeros(numedges(graph), 1);
    for i = 1:numedges(graph)
        switch graph.Edges.Weight(i)
            case 0, edge_colors(i,:) = [0, 0, 0]; line_widths(i) = 3;
            case 1, edge_colors(i,:) = [0, 0, 1]; line_widths(i) = 3;
            case 2, edge_colors(i,:) = [1, 0, 0]; line_widths(i) = 1.5;
            case 3, edge_colors(i,:) = [0, 1, 0]; line_widths(i) = 1.5;
        end
    end

    % Node styling
    node_colors = zeros(numnodes(graph), 3);
    for w = 0:3
        idx = graph.Edges.Weight == w;
        involved_nodes = unique(graph.Edges.EndNodes(idx, :));
        node_indices = find(ismember(graph.Nodes.Name, involved_nodes));
        switch w
            case 0, node_colors(node_indices,:) = repmat([0, 0, 0], numel(node_indices), 1);
            case 1, node_colors(node_indices,:) = repmat([0, 0, 1], numel(node_indices), 1);
            case 2, node_colors(node_indices,:) = repmat([1, 0, 0], numel(node_indices), 1);
            case 3, node_colors(node_indices,:) = repmat([0, 1, 0], numel(node_indices), 1);
        end
    end

    % Plot graph
    fig = figure;
    set(gca, 'FontSize', 24, 'XColor', [0,0,0], 'YColor', [0,0,0]);
    set(gcf, 'Units', 'inches', 'PaperUnits', 'inches');
    fig_width = 4^(3/2); fig_height = 3^(3/2);
    set(gcf, 'PaperPosition', [0 0 fig_width fig_height], ...
             'PaperSize', [fig_width fig_height], ...
             'Position', [1 1 fig_width fig_height]);
    xticks([]); yticks([]);
    plot(graph, 'Layout', 'force', ...
        'NodeColor', node_colors, ...
        'MarkerSize', 6, ...
        'EdgeColor', edge_colors, ...
        'LineWidth', line_widths);
end
