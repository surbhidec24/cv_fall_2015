function [ histInter ] = distanceToSet( wordHist,histograms )
    
    %wordHist is 21kx1 and histograms is 21xT
    %histInter is 1xT 
    histMin = bsxfun(@min,wordHist,histograms);
    histInter= sum(histMin,1);
end

