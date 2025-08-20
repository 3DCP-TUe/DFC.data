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
metadata = readyaml(pwd + "\system_data\setupinfo\metadata.yml");
components = get_system_components_from_system_metadata(metadata);

% Copy used components to destination folder
copy_setupinfo(library, destination, components, true);

%% End
disp('End')