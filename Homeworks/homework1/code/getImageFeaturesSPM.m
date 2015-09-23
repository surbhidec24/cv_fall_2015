function [ h ] = getImageFeaturesSPM( layerNum, wordMap, dSize )
height = size(wordMap,1);
width = size(wordMap,2);
cell_h = round(height/4);
cell_w = round(width/4);

h = zeros(21*dSize,  1);
k = 1;
for i = 1 :cell_h: (cell_h*4) 
    for j = 1 :cell_w: (cell_w*4)
        m = i - 1 + cell_h;
        n = j - 1 + cell_w;
        if (m > height)
            m = height;
        end
        if (n > width)
            n = width;
        end
        h(k : (k-1 + dSize) ,:) = getImageFeatures(wordMap(i:m,j:n),dSize);
        k = k + dSize;
    end
end

reshaped_h= reshape(h(1:16*dSize,:),[dSize,16]);
for s=1:8:16
    for t=s:2:s+2
        h(k:k+dSize-1,:)= reshaped_h(:,t)+reshaped_h(:,t+1)+reshaped_h(:,t+4)+reshaped_h(:,t+5);
        k=k+dSize;
    end
end
re_reshaped_h = reshape(h(k-(4*dSize):k-1,:),[dSize,4]);
h(k:k+dSize-1,:) = sum(re_reshaped_h,2);

h(1:16*dSize)=(h(1:16*dSize)/sum(h(1:16*dSize)))*0.5;
h(16*dSize+1:20*dSize)=(h(16*dSize+1:20*dSize)/sum(h(16*dSize+1:20*dSize)))*0.25;
h(16*dSize+1:20*dSize)=(h(16*dSize+1:20*dSize)/sum(h(16*dSize+1:20*dSize)))*0.25;
end