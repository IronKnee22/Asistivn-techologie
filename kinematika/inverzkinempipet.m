clear all
clc
 

% konst
R21=0.5;
 RM3=0.5;
% promenne pocatecni hodnoty

 d10=4;
 fi21=-pi;
 d32=0.4;
% pruvodic konce jehlz vuci 3
rM3=[0;0;-RM3;1];

J =[0 -d32*cos(fi21) -sin(fi21);0 -d32*sin(fi21) cos(fi21);1 0 0;0 0 0;0 0 0;0 1 0];


T10=[1 0 0 0;0 1 0 0;0 0 1 d10;0 0 0 1];
T21=[cos(fi21) -sin(fi21) 0 0;sin(fi21) cos(fi21) 0 0;0 0 1 R21;0 0 0 1];
T32=[1 0 0 0;0 1 0 d32;0 0 1 0;0 0 0 1];
T30=T10*T21*T32;

% konc M vuci ramu 0

rM0=T30*rM3;

Xzadan=[3.5;2;1.5];

q=[d10;fi21;d32]

E=rM0(1:3)-Xzadan;
absE=abs(E);
% pocitadlo cyklu iteraci
n=1;

while ((absE(1)>10^-4)||(absE(2)>10^-4)||(absE(3)>10^-4))
    
    
   T10=[1 0 0 0;0 1 0 0;0 0 1 d10;0 0 0 1];
T21=[cos(fi21) -sin(fi21) 0 0;sin(fi21) cos(fi21) 0 0;0 0 1 R21;0 0 0 1];
T32=[1 0 0 0;0 1 0 d32;0 0 1 0;0 0 0 1];

    T30=T10*T21*T32;
    
    %skute4hodnota
    rM0=T30*rM3;
    E=rM0(1:3)-Xzadan;
    absE=abs(E);
    
    iterchyby(:,n)=absE;
    J =[0 -d32*cos(fi21) -sin(fi21);0 -d32*sin(fi21) cos(fi21);1 0 0;0 0 0;0 0 0;0 1 0];

    InvJ=inv(J(1:3,1:3));
    q(:,n+1)=q(:,n)-(InvJ*(E));
    
 
    d10=q(1,n+1);
    fi21=q(2,n+1);
    d32=q(3,n+1);
    
    n=n+1;
    
end

q(:,end);

fi10=q(1,end)
d21=q(2,end)
d32=q(3,end)
    
    
rM0end=T30*rM3
    
    