%% DATUM RPI Students
clear;
close all;

%% Load in the data
[num,txt,raw] = xlsread('NoCourses.xlsx');
[m,n] = size(num);

returned15 = num(:,51)
%% Separate the original dataset into training and testing
s=RandStream('mt19937ar','Seed',550);
%generate a permutation of the data
p=randperm(s,m);
A=num(p,:);
returned15 = returned15(p,:);
%Use trainpct percent of the data for training and the rest for testing.
trainpct=.75;
train_size=ceil(m*trainpct);

Train = A(1:train_size,:);
Test = A(train_size+1:end,:);
YTrain = returned15(1:train_size,:);
YTest = returned15(train_size+1:end,:);

% Break them up into Class 1 and Class 0
% Classp_train = Train(YTrain==1,:);
% Classm_train = Train(YTrain==0,:);
% 
% Classp_test = Test(YTest==1,:);
% Classm_test = Test(YTest==0,:);

%% Correlation image on Train dataset
TrainNew = Train(~any(isnan(Train),2),:)
TrainCorr = corr(TrainNew)
imagesc(TrainCorr)
% heatmap = HeatMap(TrainCov)

%% Sort SOC code
SOC = sort(num(:,54),'descend')

