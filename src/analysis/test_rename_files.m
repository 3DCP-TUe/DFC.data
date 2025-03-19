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

% Folder path
folder = uigetdir(); % Open a dialog to select the folder

if folder == 0
    error('No folder selected.');
end

% Rename files in folder
sneakpeek.rename_files(folder, 'photo');

%% End
disp('End')