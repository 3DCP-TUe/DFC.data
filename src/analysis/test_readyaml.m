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

%% Read file

cd(filepath)
cd("..\template\yyyymmdd_session_1\tracer_experiment\setupinfo")
file = pwd + "\metadata.yml";
yml = readyaml(file);
fields = fieldnames(yml.software_settings.white_balance_ratio);

for i = 1:numel(fields)
    field_name = fields{i};
    field_value = yml.software_settings.white_balance_ratio.(field_name);
    fprintf('%s: %f\n', field_name, field_value);
end


%% End

disp('End')

