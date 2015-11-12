clear;clc;
tic;

eeta = 0.01;
input_layer_neurons = 8;
hidden_layer_neurons = 500;
output_layer_neurons = 1;

input_V = [[0,0,1,0,1,1,1,0];[0,1,1,0,0,1,0,1];[1,0,1,0,1,0,1,1];[1,1,1,0,1,0,1,1];[0,1,0,0,1,1,1,0]];
output_V = [[0,1,1,0,1]]';

W0 = 2*rand(input_layer_neurons,hidden_layer_neurons)-1;
W1 = 2*rand(hidden_layer_neurons,output_layer_neurons)-1;

epochs = 10000;

for j = 1:epochs
	if mod(j,epochs/10) == 0, disp(j); end
	l1 = act_sigmoid(input_V*W0,0);
	l2 = act_sigmoid((l1*W1),0);
	l2_delta = (output_V - l2) .* act_sigmoid(l2,1);
	l1_delta = ((l2_delta*W1')) .* act_sigmoid(l1,1);
	W1 = W1 + ((l1'*l2_delta)*eeta);
	W0 = W0 + ((input_V'*l1_delta)*eeta);
end
toc;


% 0.022 sec


