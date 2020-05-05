%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: E:\Project\dataset.xlsx Worksheet: dataset

%% Import the data
[~, ~, raw] = xlsread('E:\Project\dataset.xlsx','dataset','A1:U522');

%% Create output variable
dataInputs = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
%VarName1 = dataInputs(:,1);
%VarName2 = dataInputs(:,2);
%VarName3 = dataInputs(:,3);
%VarName4 = dataInputs(:,4);
%VarName5 = dataInputs(:,5);
%VarName6 = dataInputs(:,6);
%VarName7 = dataInputs(:,7);
%VarName8 = dataInputs(:,8);
%VarName9 = dataInputs(:,9);
%VarName10 = dataInputs(:,10);
%VarName11 = dataInputs(:,11);
%VarName12 = dataInputs(:,12);
%VarName13 = dataInputs(:,13);
%VarName14 = dataInputs(:,14);
%VarName15 = dataInputs(:,15);
%VarName16 = dataInputs(:,16);
%VarName17 = dataInputs(:,17);
%VarName18 = dataInputs(:,18);
%VarName19 = dataInputs(:,19);
%VarName20 = dataInputs(:,20);
%VarName21 = dataInputs(:,21);

%% Clear temporary variables
clearvars data raw;