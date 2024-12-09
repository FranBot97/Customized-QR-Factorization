%Script to add all the folder to the workspace
rootFolder=pwd;
folderPaths = genpath(rootFolder);

% Aggiunge tutte le cartelle al percorso MATLAB
addpath(folderPaths);