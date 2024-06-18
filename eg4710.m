%% 1
clc;
w_c = pi/2;%cutoff feequency
figure_number =1;

Omega_range =(0:00.01:pi);
Freq_window = zeros(size(Omega_range));% set zeros for ferquency window 
Freq_window(Omega_range<=w_c) =1;


h_d = 1*Freq_window;% Define the transfer function
magnitude =abs(h_d);
phase =angle(h_d);

figure(figure_number);
figure_number = figure_number+1;
plot(Omega_range,magnitude,'b','linewidth',1);
xlabel '\omega'
ylabel '|H-d(\omega)|'
figure(figure_number);
figure_number = figure_number+1;
plot(Omega_range,phase,'r','linewidth',2);
xlabel '\omega'
ylabel '|\Theta(\omega)|'

%%

Time_non_causal = (-20:1:20)';
h_d_n = sin(Time_non_causal * w_c)/pi./Time_non_causal;h_d_n(21)=w_c/pi;
figure(figure_number);figure_number = figure_number+1;
stem(Time_non_causal,h_d_n,'r','linewidth',2);
xlabel 'n'
ylabel '|h_d(n)|'

M = 21; % Number of taps
Time = (0:1:M-1)';
Time_window = zeros(size(Time));
Time_window(Time<M) = 1;
h_d_n = sin(Time * w_c)/pi./Time;h_d_n(1)=w_c/pi;
figure(figure_number);figure_number = figure_number+1;
stem(Time,h_d_n,'r','linewidth',2);
xlabel 'n'; ylabel '|h_d(n)|';

Shifted_time = Time - (M-1)/2;
h_n = (sin(Shifted_time * w_c)/pi./Shifted_time).*Time_window;
h_n((M-1)/2+1)=h_d_n(1); % resolving n=0 case
figure(figure_number);figure_number = figure_number+1;
stem(Time,h_n,'r','linewidth',2);
xlabel 'n'; ylabel '|h(n)|';


h_n = h_n(1:M,:); % Padding h_h when the size is smaller than FFT size
N = 512; % N point FFT
Y = fft(h_n,512);
H_f = abs(Y);
H_f = fftshift(H_f);
F = 2*pi*(-N/2:N/2-1)/N;
figure(figure_number);figure_number = figure_number+1;
plot(F,H_f,'b','linewidth',1);
xlabel '\omega '; ylabel '|H(\omega)|';


figure(figure_number);figure_number = figure_number+1;
plot(Omega_range,magnitude,'r-',F,H_f,'b.-');
xlabel '\omega'
ylabel '|H(\omega)| and |H_d(\omega)|'

%% 2
clc;
F_s = 50; T_s = 1/F_s; % sampling frequency and time
n = 0:T_s:1-T_s;
m_n = sin(2*pi*10.*n);
figure(figure_number);figure_number = figure_number+1;
plot(n,m_n,'r-');
xlabel 'n'; ylabel 'm[n]';


%%
% generate a noice signal 
noise0 = 0.1*randn(size(n));
noise1 = sin(2*pi*17.*n);
noise2 = cos(2*pi*23.*n);
noise = noise0+noise1 + noise2;
x_n = m_n+noise;
figure(figure_number);figure_number = figure_number+1;
plot(n,x_n,'b-',n,m_n,'r-.');
xlabel 'n'; ylabel 'm[n] and x[n]';


y_n = filter(h_n,1,x_n);
figure(figure_number);figure_number = figure_number+1;
plot(n,y_n,'b-',n,m_n,'r-.');
xlabel 'n'; ylabel 'm[n] and y[n]';

%% 
%%
%part 2.4
%changing the noise signal
noise2 = sin(2*pi*9.*n);
noise = noise0 + noise1 + noise2;
x_n = m_n + noise;

%plot original message signal + noise affected signal
figure(figure_number);
figure_number = figure_number+1;
plot(n, x_n, 'b-', n,m_n, 'r-.');
xlabel 'n';
ylabel 'm[n] and x[n]';
