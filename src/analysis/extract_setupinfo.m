% Requires readyaml from Maarten Jongeneel
% https://www.mathworks.com/matlabcentral/fileexchange/136369-readyaml

%% Clear and close
close all; 
clear; 
clc;

%% Get file path
path = mfilename('fullpath');
[filepath, name, ext] = fileparts(path);


%% Read session file

cd(filepath);
cd('../template/yyyymmdd_session/')

files = dir('*.yml'); % Find all .yml files in the current directory
file_paths = fullfile({files.folder}, {files.name}); % Combine folder and name

session = readyaml(file_paths{1});

%% Get all components including the folder path from the setupinfo lib

cd(filepath);
cd('../setupinfo/')

root_folder = pwd;
files = dir(fullfile(root_folder, '**', '*.yml'));

n = length(files);
names = cell(n, 1);
folders = cell(n, 1);

for i = 1:n
    [~, name, ~] = fileparts(files(i).folder);
    folders{i} = files(i).folder;
    names{i} = name;
end

%% Get all components used in this session

n = length(session.system_layout);
components = cell(n, 1);

for i = 1:n
    components{i} = session.system_layout{i}.component;
end

%% List all paths of components used

[found, indices] = ismember(components, names);

if any(~found)
    missing = components(~found);
    error('The following components were not found: %s', strjoin(missing, ', '));
end

folders_used = folders(found);

cd(filepath);
cd('test/setupinfo')
destination = pwd;
cd(filepath);

if isfolder(destination)
    rmdir(destination, 's');
end

mkdir(destination);

% Loop through each folder path in your cell array
for k = 1:length(folders_used)

    source_folder = folders_used{k};  
    [~, name, ~] = fileparts(source_folder);
    destination_folder = fullfile(destination, name);

    % Copy the folder and its entire contents recursively
    [status, msg, ~] = copyfile(source_folder, destination_folder);

    if ~status
        error('Failed to copy folder "%s" to "%s": %s', srcFolder, destFolder, msg);
    end
end

%% End
disp('End of script')