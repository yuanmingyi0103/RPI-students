%% DATUM RPI Students
clear;
close all;

%% Load in the data
[num,txt,raw] = xlsread('NoCourses.xlsx');
raw(:,2:36)
%% Change ABCD into numbers for first 35 survey questions
