clear all;
clc
load('ECGData.mat');

ekg_signal = ECGData.Data(5,1:1000);

figure;
plot(ekg_signal,'g', 'LineWidth', 3);

[peaksH, locsH] = findpeaks(ekg_signal, 'MinPeakHeight', 0, 'MinPeakDistance', 50);
hold on;


minima_locs = [];
minima_values = [];

% Pro každý nalezený peak
for i = 1:length(locsH)
    % Hledání minima vlevo od vrcholu
    region_left = max(1, locsH(i) - 10):locsH(i);
    [min_val_left, min_idx_left] = min(ekg_signal(region_left));
    minima_locs = [minima_locs, region_left(min_idx_left)];
    minima_values = [minima_values, min_val_left];
    
    % Hledání minima vpravo od vrcholu
    region_right = locsH(i):min(length(ekg_signal), locsH(i) + 10);
    [min_val_right, min_idx_right] = min(ekg_signal(region_right));
    minima_locs = [minima_locs, region_right(min_idx_right)];
    minima_values = [minima_values, min_val_right];
end

for j = 1:2:length(minima_locs)
    if j == 1
        prumer(j) = mean(ekg_signal(1:minima_locs(j)-1));
        ekg_signal(1:minima_locs(j)) = prumer(j);
    else
        prumer(j) = mean(ekg_signal(minima_locs(j-1)+1:minima_locs(j)-1));
        ekg_signal(minima_locs(j-1)+1:minima_locs(j)-1) = prumer(j);
    end

end


plot(ekg_signal(1:minima_locs(end)),'r');

