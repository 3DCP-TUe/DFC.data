% SPDX-License-Identifier: GPL-3.0-or-later
% DFC.data
% Project: https://github.com/3DCP-TUe/DFC.data
%
% Copyright (c) 2024-2025 Endhoven University of Technology
%
% Authors:
%   - Arjen Deetman (2024-2025)
%
% For license details, see the LICENSE file in the project root.

%% Clear and close
close all; 
clear;
clc;

%% Get file path
path = mfilename('fullpath');
[filepath, name, ext] = fileparts(path);
cd(filepath);

%% Add lib
addpath('lib');

%% Import session

% Read session metadata file
cd(filepath);
cd('../template/yyyymmdd_session_1/system_data/setupinfo')
folder = pwd;
metadata = dfc_data.readyaml(folder + "/metadata.yml");

% Get graph and figure
[graph, fig] = dfc_data.get_system_ontology(metadata);

%% End
disp('End')