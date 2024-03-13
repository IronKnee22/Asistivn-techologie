clear all;
clc;

x=[0.038;0.194;0.425;0.626;1.253;2.5;3.74];
y=[0.05;0.127;0.094;0.2122;0.2729;0.2665;0.3317];

beta1(1)=0.9;
beta2(1)=0.2;
n=1;

while(n<300)
beta(:,n)=[beta1(n);beta2(n)];


res(:,n)=y-((beta1(n).*x)./(beta2(n)+x))

J(:,1)=-x./(beta2(n)+x)

J(:,2)=(beta1(n).*x)./((beta2(n)+x)'*(beta2(n)+x))

% kontrola
JJ(:,:,n)=J;

pseudoJ=inv(J'*J)*J';
jednotkova=pseudoJ*J

%beta(:,n+1)=beta(:,n)-0.05.*pseudoJ*res(:,n)
beta(:,n+1)=beta(:,n)-0.05.*J'*res(:,n)

n=n+1;
beta1(n)=beta(1,n);
beta2(n)=beta(2,n);
%rozdil=abs(res(:,n));



end

