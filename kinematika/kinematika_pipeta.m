clear all;
clc

syms d10 fi21 d32 R21 RM3 v10 om21 v32

% transformační matice
T10 = [1 0 0 0; 0 1 0 0; 0 0 1 d10; 0 0 0 1];
T21 = [cos(fi21) -sin(fi21) 0 0; sin(fi21) cos(fi21) 0 0; 0 0 1 R21; 0 0 0 1];
T32 = [1 0 0 0; 0 1 0 d32; 0 0 1 0; 0 0 0 1];

rM3 = [0;0;-RM3;1];

% přímá úloha kinematiky
rM0 = T10 * T21 * T32 * rM3;

%% vektor kart translacni rychlosti vM0(x,y,z)
%základní matice rychlostí
DTZ = [0 0 0 0; 0 0 0 0; 0 0 0 1; 0 0 0 0];
DRZ = [0 -1 0 0; 1 0 0 0; 0 0 0 0; 0 0 0 0];
DTY = [0 0 0 0; 0 0 0 1; 0 0 0 0; 0 0 0 0];
V10S1 =  DTZ * v10;
V21S2 = DRZ * om21;
V32S3 = DTY * v32;

IT10 = inv(T10);
IT21 = inv(T21);
IT32 = inv(T32);

V10S3 = IT32 * IT21 *V10S1 * T21 * T32;

V21S3 = IT32*V21S2*T32;

%celkova matice rychlosti V30S3

V30S3 = V32S3 + V10S3 + V21S3;

%Vektor kart trnaslačních rychlosti vM0(x,y,z)
T30 = T10 * T21 * T32;
vM0 = T30 *V30S3 *rM3;

%Vektro kart rotačníh rychlostí OMEGA(x,y,z) z matice V30S0

V30S0 = IT10 * IT21 * IT32 * V30S3 * T32 * T21 *T10;

simV30S0 = simplify(V30S0);

OMEGA30S0_x = simV30S0(3,2);
OMEGA30S0_y = simV30S0(1,3);
OMEGA30S0_z = simV30S0(2,1);

% celkový vektor kart rychlostí VKR

VKR = [vM0(1:3); OMEGA30S0_x; OMEGA30S0_y; OMEGA30S0_z];


J = jacobian([VKR],[v10 om21 v32]);

% FN = J*[v10;om21;v32]; 




