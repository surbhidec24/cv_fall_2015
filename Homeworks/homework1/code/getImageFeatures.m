function [ h ] = getImageFeatures( wordMap, dictionarySize )
    %returns number of pixels per cluster in wordMap but normalized.
    h=hist(wordMap(:),1:dictionarySize);
    h=h/sum(h(:));
    h=transpose(h);
end

