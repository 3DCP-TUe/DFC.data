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

%% Find components and copy paste to data record (destination)

% Folder path to setupinfo library
cd(filepath);
cd('../setupinfo/')
library = pwd;

% Folder path to setupinfo of data record (destination)
cd(filepath);
cd('test/setupinfo')
destination = pwd;

% Read session metadata file
% Session 1
cd(filepath);
cd('../template/yyyymmdd_session_1/')
session1 = readyaml(pwd + "\metadata_session.yml");
% Session 2
cd(filepath);
cd('../template/yyyymmdd_session_2/')
session2 = readyaml(pwd + "\metadata_session.yml");
% Session 3
cd(filepath);
cd('../template/yyyymmdd_session_3/')
session3 = readyaml(pwd + "\metadata_session.yml");

% Get all components used in this session
components1 = sneakpeek.get_session_components(session1);
components2 = sneakpeek.get_session_components(session1);
components3 = sneakpeek.get_session_components(session1);
components = unique([components1; components2; components3]);

% Copy used components to destination folder
sneakpeek.copy_setupinfo(library, destination, components, true);

%% End
disp('End')