clear all;
clc

d10= 2;
fi21= -pi/4;
d32= 1;
R21=0.5;
RM3=0.5;

% transformační matice
T10 = [1 0 0 0; 0 1 0 0; 0 0 1 d10; 0 0 0 1];
T21 = [cos(fi21) -sin(fi21) 0 0; sin(fi21) cos(fi21) 0 0; 0 0 1 R21; 0 0 0 1];
T32 = [1 0 0 0; 0 1 0 d32; 0 0 1 0; 0 0 0 1];

rM3 = [0;0;-RM3;1];

% přímá úloha kinematiky
rM0 = T10 * T21 * T32 * rM3