%% PSO SELECTION DEMO


%% Initialize
clc
clear all
warning off all

%% Import Inputs
%% Import the data
[~, ~, raw] = xlsread('E:\Project\dataset.xlsx','dataset','A1:U522');

%% Create output variable
dataInputs = reshape([raw{:}],size(raw));


%% Clear temporary variables
clearvars data raw;

%% Import Output
%% Import the data
[~, ~, raw] = xlsread('E:\Project\dataset.xlsx','dataset','V1:V522');

%% Create output variable
dataOutput = reshape([raw{:}],size(raw));

%% Clear temporary variables
clearvars raw;

%% net
inputs = dataInputs';
targets = dataOutput';

% Create a Fitting Network
hiddenLayerSize = 2;
net = fitnet(hiddenLayerSize);

net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};


net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 10/100;
net.divideParam.testRatio = 10/100;


net.trainFcn = 'trainlm';  % Levenberg-Marquardt


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
row=267;
col=44;
%Data=randi([1,50],[row,col]);
sheet = 1;
xlRange = 'A1:U522';
Data=xlsread('dataset',sheet,xlRange);
%disp('Data---->')
%disp(Data)
nOfSelection=7;
population=20;
itrationMax=100;
fun = @(x) NMSE(x, net, inputs, targets);
%fun=@meandata;
[Selection , SelectionValue]=psoSelection(Data,nOfSelection,population,itrationMax,fun);
MinimizedData=Data(:,Selection);
disp('Selected Features---->')
disp(Selection)

attr = {'Number of anonymous type declarations', 'Number of interfaces','Number of classes','Total lines of code','Number of fields','Number of methods','Number of static fields','Number of static methods', 'Number of method calls', 'Method line of code', 'Nested block depth','Number of parameters', 'Cyclomatic complexity', 'Coupling between objects','Depth of inheritance', 'Lack of cohesion', 'Number of children','Dependence on an descendent','Count of calls of higher modules', 'Response for a class', 'Weight method per class' };


%disp(attr(Selection))
for att = Selection
   disp(attr{att}) 
end

%disp('SelectionValue---->')
%disp(SelectionValue)
%%  Features output
%disp('MinimizedData---->')
%disp(MinimizedData)
