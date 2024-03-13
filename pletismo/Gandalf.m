% Načtení dat BPM


% Přizpůsobení polynomiální regrese
degree = 3; % Zvolte stupeň polynomu
p = polyfit(1:length(bpm), bpm, degree); % Přizpůsobení polynomiálního modelu



% Hodnoty x pro vykreslení regresní čáry
x_values = linspace(1, length(bpm), 100);
y_values = polyval(p, x_values);

% Vykreslení výsledků
figure;
plot(bpm);
hold on;
plot(x_values, y_values, 'r--', 'LineWidth', 2);
legend('BPM', 'Polynomiální regresní čára');
xlabel('Časový index');
ylabel('BPM');
title('Polynomiální regresní čára přizpůsobená datům');
