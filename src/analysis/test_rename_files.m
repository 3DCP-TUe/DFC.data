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

%% Import session

% Folder path
folder = uigetdir(); % Open a dialog to select the folder

if folder == 0
    error('No folder selected.');
end

% Rename files in folder
dfc_data.rename_files(folder, 'photo');

%% End
disp('End')