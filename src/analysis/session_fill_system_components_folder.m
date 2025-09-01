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
addpath('lib/');

%% Find components and copy paste to data record (destination)

% Folder path to system components library
cd(filepath);
cd('../libraries/system_components')
library = pwd;

% Folder path to setupinfo of data record (destination)
cd(filepath);
cd('test/system_components')
destination = pwd;

% Get components from record
cd(filepath);
cd('../template/yyyymmdd_session_1')
metadata = dfc_data.readyaml(pwd + "\system_data\setupinfo\metadata.yml");
components = dfc_data.get_system_components_from_system_metadata(metadata);

% Copy used components to destination folder
dfc_data.copy_setupinfo(library, destination, components, true);

%% End
disp('End')