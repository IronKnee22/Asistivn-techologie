% Funkce pro vypocet okamzite hodnoty energie v systemu
%    
% u = [q1, q2, q3, q4, qd1, qd2, qd3, qd4]
function wc = energie(u);
global  R10 R21 RM2 m1 m2 g Deval RT11 RT22
g=9.81;
q=u(1:2);
qd=u(3:4);
fi10 = u(1);
fi21 = u(2);
% load D.mat;
% Deval = eval(D);
Wkin=0.5*qd'*Deval*qd;

rT11 = [0; RT11; 0; 1];
rT22 = [0; RT22; 0; 1];

T10 = [1 0 0 0; 0 cos(fi10) -sin(fi10) 0; 0 sin(fi10) cos(fi10) 0; 0 0 0 1];
T21 = [1 0 0 0; 0 cos(fi21) -sin(fi21) R21; 0 sin(fi21) cos(fi21) 0; 0 0 0 1];

T20 = T10 * T21;

rT10 = T10 * rT11;
rT20 = T20 * rT22;

Wpot = m1 * rT10(3) * g + m2 * rT20(3) * g;
% Wpot =  84189/100000*sin(fi21)*sin(fi43)+84189/100000*cos(fi21)*sin(fi32)*cos(fi43)+1304347/100000*(sin(fi21)*sin(fi43)+cos(fi21)*sin(fi32)*cos(fi43))*cos(fi54)+1304347/100000*cos(fi21)*cos(fi32)*sin(fi54)+1166319/100000*((sin(fi21)*sin(fi43)+cos(fi21)*sin(fi32)*cos(fi43))*cos(fi54)+cos(fi21)*cos(fi32)*sin(fi54))*cos(fi76)+1166319/100000*((-sin(fi21)*cos(fi43)+cos(fi21)*sin(fi32)*sin(fi43))*sin(fi65)+(-(sin(fi21)*sin(fi43)+cos(fi21)*sin(fi32)*cos(fi43))*sin(fi54)+cos(fi21)*cos(fi32)*cos(fi54))*cos(fi65))*sin(fi76);
%Wpot = 63/500*cos(fi21)*sin(fi32)+1129479/62500*sin(fi21)*sin(fi43)+1129479/62500*cos(fi21)*sin(fi32)*cos(fi43)+6657/1000*(sin(fi21)*sin(fi43)+cos(fi21)*sin(fi32)*cos(fi43))*cos(fi54)+6657/1000*cos(fi21)*cos(fi32)*sin(fi54)+32319/100000*((sin(fi21)*sin(fi43)+cos(fi21)*sin(fi32)*cos(fi43))*cos(fi54)+cos(fi21)*cos(fi32)*sin(fi54))*cos(fi76)+32319/100000*((-sin(fi21)*cos(fi43)+cos(fi21)*sin(fi32)*sin(fi43))*sin(fi65)+(-(sin(fi21)*sin(fi43)+cos(fi21)*sin(fi32)*cos(fi43))*sin(fi54)+cos(fi21)*cos(fi32)*cos(fi54))*cos(fi65))*sin(fi76);
Wcelk = Wkin+Wpot
wc = [Wkin, Wpot, Wcelk]; % [zluta, fialova, modra]


