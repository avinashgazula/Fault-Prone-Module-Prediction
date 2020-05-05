%% Import data from spreadsheet


%% Import the data
[~, ~, raw0_0] = xlsread('E:\Project\dataset.xlsx','dataset','B1:B365');
[~, ~, raw0_1] = xlsread('E:\Project\dataset.xlsx','dataset','C1:C365');
[~, ~, raw0_2] = xlsread('E:\Project\dataset.xlsx','dataset','E1:E365');
[~, ~, raw0_3] = xlsread('E:\Project\dataset.xlsx','dataset','K1:K365');
[~, ~, raw0_4] = xlsread('E:\Project\dataset.xlsx','dataset','N1:N365');
[~, ~, raw0_5] = xlsread('E:\Project\dataset.xlsx','dataset','O1:O365');
[~, ~, raw0_6] = xlsread('E:\Project\dataset.xlsx','dataset','R1:R365');
raw = [raw0_0,raw0_1,raw0_2,raw0_3,raw0_4,raw0_5,raw0_6];

%% Create output variable
dataInputs6 = reshape([raw{:}],size(raw));

clearvars data raw raw0_0 raw0_1 raw0_2 raw0_3 raw0_4 raw0_5 raw0_6;

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


%% Clear temporary variables
clearvars data raw1 raw1_0 raw1_1 raw1_2 raw1_3 raw1_4 raw1_5 raw1_6;