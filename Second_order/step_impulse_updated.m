clc;
clear;

% Time vector
t = 0:0.01:4;

% Zeta values
zeta = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];

% Initialize response matrices
step_response = zeros(length(t), length(zeta));
impulse_response = zeros(length(t), length(zeta));

% Calculate the step and impulse responses for each zeta value
for n = 1:length(zeta)
    num = [100];
    den = [1 2*zeta(n)*10 100];
    step_response(:,n) = step(num, den, t);
    impulse_response(:,n) = impulse(num, den, t);
end

% Plot step responses
figure;
hold on;
for n = 1:length(zeta)
    plot(t, step_response(:,n), 'DisplayName', ['Step, \zeta = ' num2str(zeta(n))]);
end

% Plot impulse responses in a different color
for n = 1:length(zeta)
    plot(t, impulse_response(:,n), '--', 'DisplayName', ['Impulse, \zeta = ' num2str(zeta(n))]);
end

% Customize plot
grid on;
title('Unit-Step and Impulse Response Curves with \omega_n = 10 and \zeta = 0 to 1')
xlabel('t (sec)')
ylabel('Response')
legend('show', 'Location', 'northeastoutside') % Show legend outside the plot

hold off;
