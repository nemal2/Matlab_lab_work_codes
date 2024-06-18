% Constants
wc1 = pi/4;     % Lower cutoff frequency
wc2 = 3*pi/4;   % Upper cutoff frequency
N = 7;          % Number of taps

% Frequency vector
w = linspace(0, pi, 1000);

% Calculate H𝑑(ω)
Hd = zeros(size(w));
alpha = 0.5; % Assuming some constant value for alpha
for i = 1:length(w)
    if w(i) > wc1 && w(i) < wc2
        Hd(i) = exp(-1i * alpha * w(i));
    end
end

% Plot magnitude response
figure;
plot(w, abs(Hd));
title('Magnitude Response of Bandpass Filter');
xlabel('Frequency (radians)');
ylabel('|H𝑑(ω)|');
grid on;

% Mark important values
hold on;
stem([wc1, wc2], [abs(Hd(find(w==wc1))), abs(Hd(find(w==wc2)))], 'r', 'LineWidth', 1.5, 'Marker', 'o');
legend('Magnitude Response', 'Cutoff Frequencies');
