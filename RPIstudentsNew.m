%% DATUM RPI Students
clear;
close all;

%% Load in the data
[num,txt,raw] = xlsread('data.xlsx');
[m,n] = size(num);