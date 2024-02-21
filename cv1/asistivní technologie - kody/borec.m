clear
load('EMG.txt')

A=[EMG(:,1) EMG(:,2)]
vstupy = abs(A(1:100,2));
vystupy = zeros(size(vstupy)); % Inicializace výstupního pole

for i = 4:vstupy
    vystupy(i) = 0.9289 * vystupy(i-1) + 0.9976 * vystupy(i-2) - 0.8698 * vystupy(i-3) ... 
        + 0.00006096 * vstupy(i) + 0.0018 * vstupy(i-1) + 0.0018 * vstupy(i-2) + 0.00006096 * vstupy(i-3);
end

figure;
plot(vystupy);