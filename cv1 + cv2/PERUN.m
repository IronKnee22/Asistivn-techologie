load('EMG.txt')

A=[EMG(:,1) abs(EMG(:,2))];

figure('name','Obálka jenom ze třetího kanálu');
plot(EMG(:,3))