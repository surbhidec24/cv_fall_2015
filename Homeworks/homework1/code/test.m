clc
clear
%load('../dat/airport/sun_afnsurhzjepmgymx.mat');
%imagesc(wordMap);
%h = getImageFeaturesSPM( 3, wordMap, 200 );
%batchToVisualWords(2)
%A=[1;2;3;4;5;6];
%reshape(A,[3,2])
I=imread('../dat/airport/sun_afnsurhzjepmgymx.jpg');
[featureVector, hogVisualization] = extractHOGFeatures(I);
figure;
imshow(I); hold on;
plot(hogVisualization);