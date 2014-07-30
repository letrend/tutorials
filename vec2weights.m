function NN=vec2weights(vec,NN)
NN.layer1=vec(1:length(NN.layer1));
NN.layer2=vec(length(NN.layer1)+1:end)';
