clear
load('EMG.txt')

A = [EMG(:,1) abs(EMG(:,2))];
plot(A(:,2))

vystupy = zeros(size(A,1), 1);

uk1 = 0;
uk2 = 0;
uk3 = 0;
uk4 = 0;

yk1 = 0;
yk2 = 0;
yk3 = 0;
yk4 = 0;

for i = 1:size(A,1)
    
    uk = A(i,2);
    yk = 1.9822*yk2 - 0.9824*yk4 + 0.00015793*uk4;
    
    vystupy(i) = yk;

    uk4 = uk3;
    uk3 = uk2;
    uk2 = uk1;
    uk1 = uk;

    yk4 = yk3;
    yk3 = yk2;
    yk2 = yk1;
    yk1 = yk;

end

figure;
plot(vystupy);
