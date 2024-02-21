% Koeficienty polynomu čitatele
b = [5.053e-06, 1.516e-05, 1.516e-05, 5.053e-06];

% Koeficienty polynomu jmenovatele
a = [0.008289, -0.0077, -0.008269, 0.007721];

% Zpoždění
Ts = 0.002; % Zpoždění nastaveno na 0.002

% Vytvoření diskrétní přenosové funkce
H = filt(b, a, Ts);

% Výpis přenosové funkce
disp('Diskrétní přenosová funkce:');
disp(H);
