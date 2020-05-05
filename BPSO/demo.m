%% PSO SELECTION DEMO


%% Initialize
clc
clear all
warning off all

%% Import Inputs
%% Import the data
[~, ~, raw] = xlsread('C:\Users\Avinash\Desktop\BPSO\dataset.csv','dataset','A1:G129');

%% Create output variable
uma_inputs = reshape([raw{:}],size(raw));


%% Clear temporary variables
clearvars data raw;

%% Import Output
%% Import the data
[~, ~, raw] = xlsread('C:\Users\Avinash\Desktop\BPSO\dataset.csv','dataset','H1:H129');

%% Create output variable
uma_outputs = reshape([raw{:}],size(raw));

%% Clear temporary variables
clearvars raw;

%% net
inputs = uma_inputs';
targets = uma_outputs';

% Create a Fitting Network
hiddenLayerSize = 2;
net = fitnet(hiddenLayerSize);

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};


% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 10/100;

% For help on training function 'trainlm' type: help trainlm
% For a list of all training functions type: help nntrain
net.trainFcn = 'trainlm';  % Levenberg-Marquardt

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'mse';  % Mean squared error

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
  'plotregression', 'plotfit'};


% Train the Network
[net,tr] = train(net,inputs,targets);

% Test the Network
outputs = net(inputs);
errors = gsubtract(targets,outputs);
%performance = perform(net,targets,outputs)

% Recalculate Training, Validation and Test Performance
trainTargets = targets .* tr.trainMask{1};
valTargets = targets  .* tr.valMask{1};
testTargets = targets  .* tr.testMask{1};
%trainPerformance = perform(net,trainTargets,outputs)
%valPerformance = perform(net,valTargets,outputs)
%testPerformance = perform(net,testTargets,outputs)


%%
row = 129;
col = 7;
%Data=randi([1,50],[row,col]);
sheet = 1;
xlRange = 'A1:G129';
Data=xlsread('dataset',sheet,xlRange);
%disp('Data---->')
%disp(Data)
nOfSelection=2;
population=20;
itrationMax=100;
fun = @(x) NMSE(x, net, inputs, targets);
%fun=@meandata;
[Selection , SelectionValue]=psoSelection(Data,nOfSelection,population,itrationMax,fun);
MinimizedData=Data(:,Selection);
disp('Selected Features---->')
disp(Selection)


%disp('SelectionValue---->')
%disp(SelectionValue)
%%  Features output
%disp('MinimizedData---->')
%disp(MinimizedData)
