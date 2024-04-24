% Funkce pro vypocet vektoru potencialnich sil 
% tg=G

function G=matice_G(u);
global  m1 m2 R10 R21 RM2 D RT11 RT22
g=9.81;

fi10 = u(1);
fi21 = u(2);

RT11=0.2;
RT22=0.17;
% Deval = eval(D);
%G = 1/10*g*m1*cos(fi10);
G(1,1)=g*m2*(RT22*cos(fi10 + fi21) + R21*cos(fi10)) + RT11*g*m1*cos(fi10);
G(2,1)=RT22*g*m2*cos(fi10 + fi21);



