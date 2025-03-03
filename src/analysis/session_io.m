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

%% Get session data

% Folder path to setupinfo of data record (destination)
cd(filepath);
cd('test/setupinfo')
setupinfo = pwd;

% Read session metadata file
cd(filepath);
cd('../template/yyyymmdd_session_1/')
session = readyaml(pwd + "\metadata_session.yml");

%% Check IO

for i = 1:length(session.io_configuration)
    component = session.io_configuration{i}.component;
    
    for j = 1:length(session.io_configuration{i}.channels)
        
        % Info from host
        host = session.io_configuration{i}.component;
        host_channel = session.io_configuration{i}.channels{j}.name; % Look in host metatdata to look up this channel details

        % Info from client
        client = session.io_configuration{i}.channels{j}.component;
        client_channel = session.io_configuration{i}.channels{j}.channel; % Look in client metatdata to look up this channel details: e.g., signal conversion factors.

    end
end

%% End
disp('End')