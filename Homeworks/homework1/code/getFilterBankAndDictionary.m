function [filterBank,dictionary] = getFilterBankAndDictionary(image_names)
filterBank= createFilterBank;
alpha=100;
K=200;
%selected_response is of dimension alpha*Tx3F
selected_responses=zeros(alpha*length(image_names),length(filterBank)*3);

for i=1:length(image_names)
    I=imread(image_names{i},'jpg');
    %pixelCount is total pixels in each R,G,B channel
    pixelCount = size(I,1)*size(I,2);
    %
    filterResponses = extractFilterResponses(I, filterBank);
    %alpha_val is an array which has alpha random numbers between 1 and
    %pixelcount. 
    alpha_val= randperm(pixelCount,alpha);
    base=(i-1)*alpha;
    for k = 1:alpha
        m=0;
        %this loop returns 3F responses per pixel
        for j=1:length(filterBank)*3
            %linearly traversing filterResponses
            selected_responses(base+k,j)=filterResponses(alpha_val(k)+m);
            m=m+pixelCount;        
        end
    end
    %alpha rows of selected_response has 3F responses (in columns) 
    %for T training images 
    imshow(I);
end

[~,dictionary] = kmeans(selected_responses,K,'EmptyAction','drop');
dictionary = transpose(dictionary);