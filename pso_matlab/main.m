% INITIALIZE THE NEURAL NETWORK PROBLEM %
% inputs for the neural net(AND gate example== 2 inputs && 4 samples)
inputs = dataInputs6';
% targets for the neural net
targets = dataOutput';
% number of neurons
n = 2;
% create a neural network
net = feedforwardnet(n);
% configure the neural network for this dataset
net = configure(net, inputs, targets);
% get the normal NN weights and bias
getwb(net)
% error MSE normal NN
error = targets - net(inputs);
calc = mean(error.^2)/mean(var(targets',1))
% create handle to the MSE_TEST function, that
% calculates MSE
h = @(x) NMSE(x, net, inputs, targets);

m = length(inputs(:,1));
o = length(targets(:,1));
    
kk = m*n + n + n + o;

[x, err_ga] = pso(h, kk)
net = setwb(net, x');
% get the PSO optimized NN weights and bias
getwb(net)
% error MSE PSO optimized NN
error = targets - net(inputs);
calc = mean(error.^2)/mean(var(targets',1))


disp('Testing')
count = 0;
for i=1:157
    tar = dataVal6(i,7);
    out = dataVal(i,1);
    results = net(tar);
    value = sigmf(results,[1 0]);
    if(value<0.5)
        value = 0;
    else
        value = 1;
    end
    
    if(out == value)
        count = count+1;
    end
        
    %disp(value);
end
disp(count);
disp(count/157);



