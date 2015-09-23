clc
clear
%load('../dat/airport/sun_aerinlrdodkqnypz.mat');
%h = getImageFeaturesSPM( 3, wordMap, 200 );
%batchToVisualWords(2)
%A=[1;2;3;4;5;6];
%reshape(A,[3,2])
C= [12     1     3     1     0     0     0     3
     5    13     1     0     0     0     1     0
     4     4    11     0     0     1     0     0
     1     2     1     5     2     4     5     0
     0     4     1     1    11     0     3     0
     0     0     0     0     3     9     6     2
     2     1     0     4     3     0     7     3
     1     0     0     2     0     0     1    16];
 D= zeros(8,1);
 for i=1:8
    D(i)= sum(C(i,:))- C(i,i);
 end