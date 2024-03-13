
clear all;
clc
z=tf('z');
%syms  z

%digital frequency (f1=1 Hz)frek rezu

om1=25.1327;

%to get transfer function of Low Pass

s=((2*(z-1))/((0.002)*(z+1)));

Ha=(om1^2/(((((2*(z-1))/((0.002)*(z+1))))^2)+sqrt(2)*(((2*(z-1))/((0.002)*(z+1))))*om1+om1^2))


%ltiview(tf(Ha))







