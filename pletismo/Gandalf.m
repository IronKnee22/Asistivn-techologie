% Načtení dat (t, y)

t = 1:282;
y = bpm;

% Definice exponenciální funkce
exp_fun = @(b, t) b(1) * exp(-b(2) * t);

% Počáteční odhady parametrů
beta = [1, 1]; % můžete si zvolit jiné počáteční odhady

% Hyperparametry gradientního sestupu
learning_rate = 0.001; % velikost kroku
max_iterations = 1000; % maximální počet iterací
tolerance = 1e-6; % tolerance pro zastavení algoritmu

% Iterativní optimalizace pomocí gradientního sestupu
for iter = 1:max_iterations
    % Výpočet gradientu
    grad = zeros(size(beta));
    for i = 1:length(beta)
        % Numerický výpočet gradientu
        beta_up = beta;
        beta_up(i) = beta_up(i) + tolerance;
        grad(i) = (sum((y - exp_fun(beta_up, t)) .^ 2) - sum((y - exp_fun(beta, t)) .^ 2)) / tolerance;
    end
    
    % Aktualizace parametrů
    beta = beta - learning_rate * grad;
    
    % Kritérium zastavení
    if norm(grad) < tolerance
        break;
    end
end

% Vyhodnocení modelu
y_pred = exp_fun(beta, t);
RMSE = sqrt(mean((y - y_pred).^2)); % Root Mean Squared Error

% Výstupní hodnoty
disp(['Parametry modelu: b0 = ', num2str(beta(1)), ', b1 = ', num2str(beta(2))]);
disp(['RMSE: ', num2str(RMSE)]);

% Vizualizace výsledků
plot(t, y, 'b', t, y_pred, 'r-');
xlabel('Čas');
ylabel('Hodnota y');
legend('Data', 'Exponenciální regrese');
