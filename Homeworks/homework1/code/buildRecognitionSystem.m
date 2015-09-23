clc
clear
load('../dat/traintest.mat'); 
load('dictionary.mat');
train_features = getTrainFeatures( train_imagenames ,size(dictionary,2));
save('vision.mat','filterBank','dictionary','train_features','train_labels'); 