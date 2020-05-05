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

%% Import the data
[~, ~, raw1_0] = xlsread('E:\Project\dataset.xlsx','dataset','B366:B522');
[~, ~, raw1_1] = xlsread('E:\Project\dataset.xlsx','dataset','C366:C522');
[~, ~, raw1_2] = xlsread('E:\Project\dataset.xlsx','dataset','E366:E522');
[~, ~, raw1_3] = xlsread('E:\Project\dataset.xlsx','dataset','K366:K522');
[~, ~, raw1_4] = xlsread('E:\Project\dataset.xlsx','dataset','N366:N522');
[~, ~, raw1_5] = xlsread('E:\Project\dataset.xlsx','dataset','O366:O522');
[~, ~, raw1_6] = xlsread('E:\Project\dataset.xlsx','dataset','R366:R522');
raw1 = [raw1_0,raw1_1,raw1_2,raw1_3,raw1_4,raw1_5,raw1_6];

%% Create output variable
dataVal6 = reshape([raw1{:}],size(raw1));

%% Allocate imported array to column variable names
%VarName23 = dataInputs6(:,1);
%VarName25 = dataInputs6(:,2);
%VarName27 = dataInputs6(:,3);
%VarName29 = dataInputs6(:,4);
%VarName31 = dataInputs6(:,5);
%VarName33 = dataInputs6(:,6);

%% Clear temporary variables
clearvars data raw1 raw1_0 raw1_1 raw1_2 raw1_3 raw1_4 raw1_5 raw1_6;