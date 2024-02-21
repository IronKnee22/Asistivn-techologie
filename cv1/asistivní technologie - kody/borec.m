clear
load('EMG.txt')

A = [EMG(:,1) abs(EMG(:,2))];
plot(A(:,2))

vystupy = zeros(size(A,1), 1);

uk1 = 0;
uk2 = 0;
uk3 = 0;

yk1 = 0;
yk2 = 0;
yk3 = 0;

for i = 1:size(A,1)
    if i >=2000
        i = 1
    end
    uk = A(i,2);
    yk = 0.9289*yk1 + 0.9976*yk2 - 0.8698*yk3 + 0.00006096*uk + 0.0018*uk1 + 0.0018*uk2 + 0.00006096*uk3;
    
    vystupy(i) = yk;

    uk3 = uk2;
    uk2 = uk1;
    uk1 = uk;

    yk3 = yk2;
    yk2 = yk1;
    yk1 = yk;

end

figure;
plot(vystupy);
