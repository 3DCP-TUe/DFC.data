% SPDX-License-Identifier: GPL-3.0-or-later
% DFC.data
% Project: https://github.com/3DCP-TUe/DFC.data
%
% Copyright (c) 2024-2025 Eindhoven University of Technology
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

% Folder path
folder = uigetdir(); % Open a dialog to select the folder

if folder == 0
    error('No folder selected.');
end

% Remove files with extension '.asv'
dfc_data.remove_files_by_extension(folder, '.asv');

%% End
disp('End')