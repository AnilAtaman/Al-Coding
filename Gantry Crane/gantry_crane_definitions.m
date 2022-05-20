%Gantry Crane
clear;
clc;

%Define Knowns
M = 50; %mass of cart in kg
m = 10; %mass of load in kg
l = 15; %lenght of crane in meters
g = 9.81; %gravity constant

% Consant Force Parameters
tf = 70; %final time for force
ts = tf/2; %switch time
f = 2; % force in Newtons

%Linear System State Space Model


