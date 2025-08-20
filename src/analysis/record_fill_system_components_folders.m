%{
This file is part of DFC.data. DFC.data is licensed under the 
terms of GNU General Public License as published by the Free Software 
Foundation. For more information and the LICENSE file, see 
<https://github.com/3DCP-TUe/DFC.data>.
%}

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

%% Find components in sessions and fill system_data\setupinfo

% Folder path to setupinfo library
cd(filepath);
cd('../libraries/system_components')
library = pwd;

% Folder path to record
cd(filepath);
cd('..\template')
record = pwd;

%{
% Folder path to setupinfo library
library = uigetdir(); % Open a dialog to select the folder

% Folder path to record
record = uigetdir(); % Open a dialog to select the folder

if library == 0
    error('No libary folder selected.');
end

if record == 0
    error('No record folder selected.');
end
%}

% Fil the setupinfo of the session system_data folders
fill_record_system_data_components(library, record, 'system', true); % use 'system' for system components and 'material' for material components

%% End
disp('End')