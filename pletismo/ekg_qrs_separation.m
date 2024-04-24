% Načtení dat
clear all;
clc
load('ECGData.mat');


% Načtení signálu EKG
ekg_signal = ECGData.Data(1,1:1000);

% Nastavení parametrů filtru
order = 5; % Řád filtru
cutoff_freq = 50; % Řezná frekvence v Hz
fs = 1000;

% Vytvoření Butterworthova filtru
[b, a] = butter(order, cutoff_freq/(fs/2));

% Aplikace filtru na signál EKG
filtered_signal = filtfilt(b, a, ekg_signal);

% Zobrazení původního a filtrovaného signálu
plot(ekg_signal);
hold on;
plot(filtered_signal);
legend('Původní signál', 'Filtrovaný signál');
xlabel('Čas');
ylabel('Amplituda');
title('Filtrovaní EKG signálu pomocí Butterworthova filtru');


