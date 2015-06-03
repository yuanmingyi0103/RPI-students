%% DATUM RPI Students
clear;
close all;

%% Load in the data
[num,txt,raw] = xlsread('Cross out blanks in registered 14.xlsx');

%% SAT and ACT score convertion in num part

[m,n] = size(num);
for i = 1:m;
    if num(i,46) == 22
        num(i,45) = 1030;
    elseif num(i,46) == 23
        num(i,45) = 1070;
    elseif num(i,46) == 24
        num(i,45) = 1110;
    elseif num(i,46) == 25
        num(i,45) = 1150;
    elseif num(i,46) == 26
        num(i,45) = 1220;
    elseif num(i,46) == 27
        num(i,45) = 1220; 
    elseif num(i,46) == 28
        num(i,45) = 1260;
    elseif num(i,46) == 29
        num(i,45) = 1300;
    elseif num(i,46) == 30
        num(i,45) = 1340;
    elseif num(i,46) == 31
        num(i,45) = 1380;
    elseif num(i,46) == 32
        num(i,45) = 1420; 
    elseif num(i,46) == 33
        num(i,45) = 1460;
    elseif num(i,46) == 34
        num(i,45) = 1510; 
    elseif num(i,46) == 35
        num(i,45) = 1560;
    elseif num(i,46) == 36
        num(i,45) = 1600;
    end
end

xlswrite('Cross out blanks in registered 14.xlsx',num(:,45),'AS2:AS1358')

%% Mean center SAT score
count = 0;
for i = 1:m
    if (~isnan(num(i,50)))
       count = count + 1;
    end
end

A = zeros(count, n);

for i = 1:m
    if (~isnan(num(i,50)))
        A(i,:) = num(i,:);
    end
end

a = A(:,1)

A

[B,I] = sort(abs(a));

keep = I(13:end);
A = A(keep,:);

SAT = A(:,45);
SAT_mean_centered = SAT - mean(SAT);

first_year_GPA = A(:,50);


C = cov(SAT_mean_centered, first_year_GPA);

% imagesc(C)   
% colormap(gray);
% colorbar;
%% Clustering, run K-means for nC=3 clusters

nC = 3;
SATreg = num(:,[45,47]);

% Do k-means with 10 restarts. 
opts = statset('Display','final');
[cidx, ctrs, SUMD, D]= kmeans(SATreg, nC,'Replicates',10,'Options',opts);

% K=means objective
objective = sum(SUMD);
% 
% figure
% hold on
% set(gca,'YTick',[-1;0;1])
% set(gca,'XTick',[0;900;1600])
% plot(SATreg(:,1),SATreg(:,2),'*');


%% Survey part
survey = A(:,[2,3,4,14]); % take out the parts i think are important


%% Plot SAT scores, first year GPA and if they returned

% RFall14 = 

figure
hold on 
for i = 1:m
    if num(i,51) == 0
        plot(num(i,45),num(i,50),'*','MarkerSize',5,'Color','red')
    else if num(i,51) == 1
            plot(num(i,45),num(i,50),'*','MarkerSize',5,'Color','blue')
            
        end
    end
end

xlabel('SAT Score');
ylabel('First Year GPA');
title('SAT, First year GPA, Returned Fall 2015');

hold off




        