%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: E:\Project\dataset.xlsx Worksheet: dataset


%% Import the data
[~, ~, raw] = xlsread('E:\Project\dataset.xlsx','dataset','V1:V365');

%% Create output variable
dataOutput = reshape([raw{:}],size(raw));

%% Import the data
[~, ~, raw1] = xlsread('E:\Project\dataset.xlsx','dataset','V366:V522');

%% Create output variable
dataVal = reshape([raw1{:}],size(raw1));

%% Clear temporary variables
clearvars raw raw1;