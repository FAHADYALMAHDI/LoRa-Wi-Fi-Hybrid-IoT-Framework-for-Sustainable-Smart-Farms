clc;
clear;

disp('System started (MATLAB simulation)');
disp('----------------------------------');

% Initial simulated sensor values
temperature = 25;     % Celsius
humidity = 60;        % Percentage
soilMoisture = 600;   % Analog value (0–1023)

for cycle = 1:20   % Number of simulation loops

    % ===== Simulated sensor readings =====
    temperature = temperature + (-0.5 + rand);
    humidity = humidity + (-0.5 + rand);
    soilMoisture = soilMoisture + randi([-30 30]);

    % Limit values
    temperature = max(min(temperature, 40), 15);
    humidity = max(min(humidity, 90), 30);
    soilMoisture = max(min(soilMoisture, 1023), 0);

    % ===== LCD display (Temperature & Humidity) =====
    disp('[LCD]');
    fprintf('Temp: %.1f C\n', temperature);
    fprintf('Humidity: %.1f %%\n', humidity);
    pause(2);

    % ===== LCD display (Soil moisture) =====
    disp('[LCD]');
    fprintf('Soil Moisture: %d\n', soilMoisture);

    % ===== Water pump logic =====
    if soilMoisture > 450
        disp('Soil is DRY');
        disp('Pump ON');
        pause(1);
        disp('Pump OFF');
    else
        disp('Soil is WET');
        disp('Pump OFF');
    end

    disp('----------------------------------');
    pause(2);
end
