%% DATUM RPI Students - Predict leaving Spring 2015
clear;
close all;
%%
[poor,txt,raw] = xlsread('NoCoursesWithGPA.xlsx');

data = poor(:,2:end);
first_gpa = data(:,46);
%%
good = nan(size(data));
poor = nan(size(data));
[m,n] = size(data);

for i = 1:m;
    if first_gpa(i) >= 3.0;
        good(i,:) = data(i,:);
    end
    if first_gpa(i) <= 2.5;
        poor(i,:) = data(i,:);
    end
end

good = good(~any(isnan(good),2),:); %remove students with missing data
poor = poor(~any(isnan(poor),2),:); %remove students with missing data

%%

figure
imagesc(corr(good))
title('Good Students')
colorbar

figure
imagesc(corr(poor))
title('Poor Performers')
colorbar
