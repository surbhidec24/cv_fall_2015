function [filterResponses] = extractFilterResponses(I, filterBank)
% CV Fall 2015 - Provided Code
% Extract the filter responses given the image and filter bank
% Pleae make sure the output format is unchanged. 
% Inputs: 
%   I:                  a 3-channel RGB image with width W and height H 
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W*H x N*3 matrix of filter responses
 
%Convert input Image to Lab
if (size(I,3)==1)
    I=repmat(I,[1,1,3]);
end
doubleI = double(I);
[L,a,b] = RGB2Lab(doubleI(:,:,1), doubleI(:,:,2), doubleI(:,:,3));
%pixelCount = size(doubleI,1)*size(doubleI,2);
%filterResponses:    a W*H x N*3 matrix of filter responses
filterResponses = zeros(size(doubleI,1), size(doubleI,2), length(filterBank)*3);

%for each filter and channel, apply the filter, and vectorize
k=1;
for i=1:length(filterBank)

    filterResponses(:,:,k)= imfilter(L,cell2mat(filterBank(i)));
    filterResponses(:,:,k+1)= imfilter(a,cell2mat(filterBank(i)));
    filterResponses(:,:,k+2)= imfilter(b,cell2mat(filterBank(i)));
    k=k+3;
    
end
end
