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

%% Find components and copy pasta to data record (destination)

% Folder path to setupinfo library
cd(filepath);
cd('../setupinfo/')
library = pwd;

% Folder path to setupinfo of data record (destination)
cd(filepath);
cd('test/setupinfo')
destination = pwd;

% Read session metadata file
cd(filepath);
cd('../template/yyyymmdd_session/')
session = readyaml(pwd + "\metadata.yml");

% Get all components used in this session
components = sneakpeek.get_session_components(session);

% Copy used components to destination folder
sneakpeek.copy_setupinfo(library, destination, components, true);

%% End
disp('End')