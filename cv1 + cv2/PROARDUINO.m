clear;
load 'EMG.txt';

A=[EMG(:,1) EMG(:,2)];

y = [];
x = EMG(4:size(EMG,1)-3,1);
for i=4:size(A,1)-3
    yk1 = A(i-1,2);
    yk2 = A(i-2,2);
    yk3 = A(i-3,2);
    
    uk = A(i,1);
    uk1 = A(i-1,1);
    uk2 = A(i-2,1);
    uk3 = A(i-3,1);
    
    yk = 0.9289*yk1 + 0.9976*yk2 - 0.8698*yk3 + 0.00006096*uk + 0.0018*uk1 + 0.0018*uk2 + 0.00006096*uk3;
    y = [y, yk];
    
end

plot(x,y);