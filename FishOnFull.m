%% 

[num,txt,raw] = xlsread('DataWoutCat.xlsx');

num = num(~any(isnan(num),2),:); %remove students with missing data















