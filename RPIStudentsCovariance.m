%% DATUM RPI Students
clear;
close all;

%% Load in the data
[num,txt,raw] = xlsread('NoCourses.xlsx');


num = num(~any(isnan(num),2),:); %remove students with missing data

data = num(:,2:end); % remove survey number
%% Correlation matrix with all the data

cor = corr(data);


figure
imagesc(cor)
title('Correlation Matrix')
colorbar

%% Convert GPA

hs_gpa = data(:, 54:end);
[m,n] = size(hs_gpa);

gpa = hs_gpa(:,1);
gpa_scale = hs_gpa(:,2);

for i = 1:m;
    if gpa_scale(i) == 100;
        if and(gpa(i) <=100, gpa(i) >= 93);
            gpa(i) = 4;
        end
        if and(gpa(i) <93, gpa(i) >= 90);
            gpa(i) = 3.67;
        end
        if and(gpa(i) <90, gpa(i) >= 87);
            gpa(i) = 3.33;
        end
        if and(gpa(i) <87, gpa(i) >= 83);
            gpa(i) = 3;
        end
        if and(gpa(i) <83, gpa(i) >= 80);
            gpa(i) = 2.67;
        end
    end
end
    
