clc
clear
load('../dat/traintest.mat');
C=zeros(8,8);
for i=1:length(test_imagenames)
    Num=guessImage(strcat(('../dat/'),test_imagenames{i}));
    C(test_labels(i),Num)=C(test_labels(i),Num)+1;
end

final=(trace(C)/sum(C(:)))*100;
disp(C);

fprintf('final result=%f',final);