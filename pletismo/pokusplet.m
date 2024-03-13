clear all;
clc;
close all;

% Načtení dat
plet3 = load('plet3.txt');
plet3mod = plet3(1:2:end, 2); % Pouze sudé řádky

% Výpočet derivace
derivative = diff(plet3mod(:, 1));

% Nastavení proměnných
window_size = 200;
threshold = 0.0025;
neighborhood = 200;

% Inicializace pole pro ukládání indexů maxim
max_indices = [];

% Průchod k nalezení maxim
for i = 2:window_size:size(derivative, 1)
    if i + window_size > size(derivative, 1)
        break;
    end

    temp_max = [-999, 0]; % Inicializace temporálního maxima

    for j = i:i+window_size
        if derivative(j) > threshold && derivative(j) > temp_max(1)
            % Kontrola sousedních hodnot
            passed = true;
            for k = 1:neighborhood
                if (j-k > 0 && j+k < size(derivative, 1)) && ...
                   (derivative(j-k) > derivative(j) || derivative(j+k) > derivative(j))
                    passed = false;
                    break;
                end
            end
            if passed
                temp_max = [derivative(j), j];
            end
        end
    end
    if temp_max(2) > 0
        max_indices = [max_indices, temp_max(2)];
    end
end

% Výpočet BPM
bpm = [];
differences = diff(max_indices);
valid_diff_indices = differences > 100;
valid_diffs = differences(valid_diff_indices);
for z = 1:size(valid_diffs, 2)
    if valid_diffs(z) > 100
        period = valid_diffs(z) * 0.001;
        temp_bpm = (1/period) * 60;
        if temp_bpm < 220 
            bpm = [bpm, temp_bpm];
        end
    end
end

% Vykreslení grafu derivace s nalezenými maximy
highlighted = zeros(size(derivative));
highlighted(max_indices') = derivative(max_indices');
plot(derivative);
hold on;
plot(1:size(derivative), highlighted, 'r*');

% Vykreslení BPM
figure;
plot(bpm);
