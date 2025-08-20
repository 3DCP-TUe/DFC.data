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

% Read session metadata file
cd(filepath);
cd('../template/yyyymmdd_session_1/system_data/setupinfo')
folder = pwd;
metadata = dfc_data.readyaml(folder + "/metadata.yml");

% Get graph and figure
[graph, fig] = dfc_data.get_system_ontology(metadata);

%% End
disp('End')