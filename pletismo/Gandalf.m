clc;
close all;

x = 1:282;
y = bpm;

beta1(1) = 111;
beta2(1) = 1;
n = 1;

while(n < 200)
    beta(:,n) = [beta1(n); beta2(n)];

    res(:,n) = y - ((beta1(n) .* x) ./ (beta2(n) + x));
    J(:,1) = -x ./ (beta2(n) + x);
    J(:,2) = (beta1(n) .* x) ./ ((beta2(n) + x) .* (beta2(n) + x));

    % Kontrola
    JJ(:,:,n) = J;

    pseudoJ = inv(J' * J) * J';
    jednotkova = pseudoJ * J;

    %beta(:,n+1) = beta(:,n) - 0.05 .* pseudoJ * res(:,n);
    beta(:,n+1) = beta(:,n) - 0.05 .* J' * res(:,n);

    n = n + 1;
    beta1(n) = beta(1,n);
    beta2(n) = beta(2,n);
    %rozdil = abs(res(:,n));
end

% Vypočítané hodnoty regresní funkce pro všechny hodnoty x
y_regression = beta(1,end) .* x ./ (beta(2,end) + x);

% Zobrazení grafu dat a regresní funkce
figure;
plot(x, y); % Zobrazíme data
hold on;
plot(x, y_regression, 'r-'); % Zobrazíme regresní funkci

