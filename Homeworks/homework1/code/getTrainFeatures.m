function [ train_features ] = getTrainFeatures( train_imagenames, dSize )
train_features=zeros(21*dSize,length(train_imagenames));
for i=1:length(train_imagenames)
    load(strcat(('../dat/'),strrep(train_imagenames{i},'.jpg','.mat')));
    
    train_features(:,i)=getImageFeaturesSPM( 3, wordMap, dSize);
end
end

