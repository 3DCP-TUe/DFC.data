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

% Read session metadata file
cd(filepath);
cd('../template/yyyymmdd_session_3/')
folder = pwd;
session = readyaml(folder + "\metadata_session.yml");

% Get graph and figure
[graph, fig] = sneakpeek.get_system_ontology(session);

%% End
disp('End')