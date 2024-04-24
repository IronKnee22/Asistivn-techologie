% Funkce pro vypocet vystupu systemu q a jeho derivace dq
% q  = inv(D)*(int)^2[(tau - C(q,dq)-G(q))]dt^2
%    = inv(D)*td
% dq = inv(D)*(int)[(tau - C(q,dq)-G(q))]dt
%    = inv(D)*tdd
% vstupni funkce: 
% u = [td1, td2, td3, td4, tdd1, tdd2, tdd3, tdd4]
function y = matice_Q(u);
global fi10 fi21 Deval
td=u(1:2);
tdd=u(3:4);



% load D.mat;
% Deval = eval(D);
Dinv=inv(Deval);

yy=Dinv*td;
yd=Dinv*tdd;
y=[yy;yd];



