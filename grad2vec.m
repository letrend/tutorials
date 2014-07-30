function vec=grad2vec(NN)
vec=[NN.delta_layer1(:);NN.delta_layer2(:)];