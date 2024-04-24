clear all;
clc;

syms R21 RM2 fi10 fi21 om10 om21 m1 m2 I1x I1y I1z I2x I2y I2z RT11 RT22 g

T10 = [1 0 0 0; 0 cos(fi10) -sin(fi10) 0; 0 sin(fi10) cos(fi10) 0; 0 0 0 1];
T21 = [1 0 0 0; 0 cos(fi21) -sin(fi21) R21; 0 sin(fi21) cos(fi21) 0; 0 0 0 1];

rM2 = [0;RM2;0;1];

% diferenční rotační maticovy operátor

DRX = [0 0 0 0; 0 0 -1 0; 0 1 0 0; 0 0 0 0];

% základní matice rychlstí v kinem dvojcích
V10S1 = DRX*om10;
V21S2 = DRX*om21;

% celková matice rychlsoti (2) vůči (0) v systému souřadnic (2) V20S2
IT10 = inv(T10);
IT21 = inv(T21);

V10S2 = IT21 * V10S1 * T21;

simV10S2 = simplify(V10S2);

V20S2 = V21S2 + simV10S2;

% vektor kart translační rychlosti (M) vuci (0) vM0 (x,y,z)
T20 = T10 *T21;

vM0 = T20 * V20S2 * rM2;

simvM0 = simplify(vM0);

% vektor katézkých rotačních rychlostí OMEGA(x,y,z) získám z matice V20S0

V20S0 = IT10 * IT21 * V20S2 * T21 * T10;
simV20S0 = simplify(V20S0);

OMEGA20S0 = [simV20S0(3,2);simV20S0(1,3);simV20S0(2,1)];

% jakobian J2 cele hnaty
VKR = [vM0(1:3);OMEGA20S0];

J2 = jacobian([VKR], [om10 om21]);
simJ2 = simplify(J2);

simplify(VKR - simJ2*[om10;om21]); % tohle je jenom kontrola

% jakobian Ji po amptaci kolene (2)

r21=T21(:,4);

% vektor kart transl rychlost po amp
v10 = T10 * V10S1 * r21;
V10S0 = IT10* V10S1*T10;
simV10S0 = simplify(V10S0);


% vektor kart rotacni rychl po amp (2)
OMEGA10S0 = [simV10S0(3,2);simV10S0(1,3);simV10S0(2,1)];

VKR1 = [v10(1:3);OMEGA10S0];

J1 = jacobian([VKR1],[om10]);

% matici dinamiky translační polovinu D_tr

Itr = m1 *J1(1:3).' *J1(1:3);

IItr = m2 *simJ2(1:3,1:2).'*simJ2(1:3,1:2);


Dtr(1,1) = Itr(1,1) + IItr(1,1);
Dtr(1,2) =  IItr(1,2);
Dtr(2,1) =  IItr(2,1);
Dtr(2,2) =  IItr(2,2);
simDtr = simplify(Dtr);

% matice dinamiky rotační poloviny D_rot

S10 = T10(1:3,1:3);
S20 = T20(1:3,1:3);

I1 = [I1x 0 0; 0 I1y 0; 0 0 I1z];
I2 = [I2x 0 0; 0 I2y 0; 0 0 I2z];

Irot = J1(4:6,1) .'*S10*I1*S10.'*J1(4:6,1);
IIrot = J2(4:6,1:2) .'*S20*I2*S20.'*J2(4:6,1:2);


Drot(1,1) = Irot(1,1) + IIrot(1,1);
Drot(1,2) =  IIrot(1,2);
Drot(2,1) =  IIrot(2,1);
Drot(2,2) =  IIrot(2,2);
simDrot = simplify(Drot);


D = simDtr + simDrot
simD = simplify(D)

% matice tíhových účinků sil G(q)

rT11 = [0;RT11;0;1];
rT22 = [0;RT22;0;1];

rT10 = T10*rT11;
rT20 = T20 * rT22;

Wpot = m1*g*rT10(3) + m2*g*rT20(3);

G(1,1) = diff(Wpot,'fi10');
G(2,1) = diff(Wpot,'fi21');

simG = simplify(G);

save matice simD simG





