% INITIALIZE THE NEURAL NETWORK PROBLEM %
% inputs for the neural net
inputs = dataInputs6';
% targets for the neural net
targets = dataOutput';
% number of neurons
n = 2;
% create a neural network
net = feedforwardnet(n);
% configure the neural network for this dataset
net = configure(net, inputs, targets);
count = 30;
% get the normal NN weights and bias
getwb(net)
% error MSE normal NN
error = targets - net(inputs);
calc = mean(error.^2)/mean(var(targets',1))
% create handle to the MSE_TEST function, that
% calculates MSE
h = @(x) NMSE(x, net, inputs, targets);
% Setting the Genetic Algorithms tolerance for
% minimum change in fitness function before
% terminating algorithm to 1e-8 and displaying
% each iteration's results.
% PLEASE NOTE: For a feed-forward network
% with n hidden neurons, 3n+n+1 quantities are required
% in the weights and biases column vector.
% a. n for the input weights=(features*n)=2*n
% b. n for the input biases=(n bias)=n
% c. n for the output weights=(n weights)=n
% d. 1 for the output bias=(1 bias)=1
% running the particle swarm optimization algorithm with desired options
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
%P = [21 1 0.28 63 12 12 47.36]';

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



