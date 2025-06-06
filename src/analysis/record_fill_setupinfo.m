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

%% Find components in sessions and fill system_data\setupinfo

%{
% Folder path to setupinfo library
cd(filepath);
cd('../setupinfo/')
library = pwd;

% Folder path to record
cd(filepath);
cd('..\template')
record = pwd;
%}

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

% Fil the setupinfo of the session system_data folders
sneakpeek.fill_record_setupinfo(library, record, true);

%% End
disp('End')