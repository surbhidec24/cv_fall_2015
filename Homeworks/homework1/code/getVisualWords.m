function [ WordMap ] = getVisualWords( I, filterBank, dictionary )
    %this function maps X.jpg to X.mat
    %wordMap (output) contains a value between 1 and k for all pixels of 
    %the image that is the cluster number to which it mostly belongs. 
    [m,n,~]=size(I);
    filterResponse = extractFilterResponses(I, filterBank);
    filter_new = reshape(filterResponse,[],size(filterResponse,3));
    [~,WordMap] = min(pdist2(filter_new,transpose(dictionary)),[],2);
    WordMap = reshape(WordMap,[m,n]);
    %imagesc(WordMap);
end

