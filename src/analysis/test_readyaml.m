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

%% Read file

cd(filepath)
cd("..\template\yyyymmdd_session_1\tracer_experiment\setupinfo")
file = pwd + "\metadata.yml";
yml = readyaml(file);
fields = fieldnames(yml.software_settings.white_balance_ratio);

for i = 1:numel(fields)
    fieldName = fields{i};
    fieldValue = yml.software_settings.white_balance_ratio.(fieldName);
    fprintf('%s: %f\n', fieldName, fieldValue);
end


%% End

disp('End')

