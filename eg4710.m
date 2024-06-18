%% part 1_1
%discrete time signal
n= 0:20;
f=0.05 ; 
f2=0.1 ; 
phase = 0;
A = 1.5;
x = A * cos( 2 * pi * f * n - phase);
x2 = A * cos( 2 * pi * f2 * n - phase);
figure;
stem(n,x);
title('Cosine Sequence');
xlabel('Time Index n');
ylabel('Amplitude x');
axis([0 20 -2 2]);
grid;
figure;

stem(n,x2);
title('Cosine Sequence');
xlabel('Time Index n');
ylabel('Amplitude x');
axis([0 20 -2 2]);
grid;


%Decompos of signal in even and odd part
clc; clear all;
n = -3:3;
((n==0)==1);
((n==1)==1);
((n==2)==1);
((n==3)==1);
xn= ((n==0)==1) + ((n==1)==1) + ((n==2)==1) + ((n==3)==1);

figure;
%figure into m by n matrix 

%original signal
subplot(3,1,1);
stem(n,xn,'filled');
xlabel('n');
ylabel('x[n]');
title('Plot of x[n]');
grid;
%flipleft to right
xN = fliplr(xn);
%even part
xe = (xn +xN)/2;
% odd part
xo = (xn -xN)/2;
%decomposition process
verify = xn - (xe +xo);
%Draw the even part
subplot(3,1,2);
stem(n,xe , 'filled');
xlabel('n');
ylabel('xe[n]');
title('Even part');
grid;

%odd part
subplot(3,1,3);
stem(n,xo , 'filled');
xlabel('n');
ylabel('xo[n]');
title('Odd part');
grid;


n = -4 : 9;
x = ((n+1)==0) + (n==0) + ((n-1)==0) + ((n-2)==0) + ((n-3)==0) + 0.5*((n-4)==0);
figure;
subplot(5,1,1);
stem(n,x,'filled');
title('x[n]');
xlabel('n');
ylabel('x[n]');
grid;
x_a = (((n-2)+1)==0) + ((n-2)==0) + (((n-2)-1)==0) + (((n-2)-2)==0) + (((n-2)-3)==0) + 0.5*(((n-2)-4)==0);
subplot(5,1,2);
stem(n,x_a,'filled');
title('x[n-2]');
xlabel('n');
ylabel('x[n-2]');
grid;
x_b = ((-n+1)==0) + (-n==0) + ((-n-1)==0) + ((-n-2)==0) + ((-n-3)==0) + 0.5*((-n-4)==0);
subplot(5,1,3);
stem(n,x_b,'filled');
title('x[-n]');
xlabel('n');
ylabel('x[-n]');
grid;
x_c = (((4-n)+1)==0) + ((4-n)==0) + (((4-n)-1)==0) + (((4-n)-2)==0) + (((4-n)-3)==0) + 0.5*(((4-n)-4)==0);
subplot(5,1,4);
stem(n,x_c,'filled');
title('x[4-n]');
xlabel('n');
ylabel('x[4-n]');
grid;
x_d = (((n+3)+1)==0) + ((n+3)==0) + (((n+3)-1)==0) + (((n+3)-2)==0) + (((n+3)-3)==0) + 0.5*(((n+3)-4)==0);
subplot(5,1,5);
stem(n,x_d,'filled');
title('x[n+3]');
xlabel('n');
ylabel('x[n+3]');
grid;
x_d = (((n+3) + 1)==0)+ ((n+3)==0)+ (((n+3) -1)==0)+(((n+3) -2)==0)+(((n+3) -3)==0)+0.5*((((n+3) -4)==0));
subplot(5,1,5);
stem(n,x_d,'filled'); 
title('x[n+3]');
xlabel('n');
ylabel('x[n+3]');
grid;



%% Part 2_1
%Ztrans
clc,clear all;
syms n;
f = ((-1).^n) * 2^-n
y = ztrans(f)

%% Part 2_2
x1=[2,3,4 ];
x2=[3,4,5,6];
x3=conv(x1,x2);

%% inverse
% Inverse z transform
syms z
x=z/(z+0.5)
i_x=iztrans(x)
f=1/(((1-0.9*z^-1)^2)*(1+0.9*z^-1))
%Inver z trans
i_f=iztrans(f)



%% P_art 2_4
% zero pole diagram
figure()
z=[0];
p=[0.5;-0.75];
zplane(z,p)

%% Part 3 Discrete time Fourier Transformation

n = [0 1 2 3 4];
x = [1 1 1 1 1];


w = linspace(0 , 2*pi , 600)

Xdtft = x(1) + x(2) * exp(-j*w) + x(3) * exp(-j*2*w);

figure
subplot(2,1,1);
plot(w/pi,abs(Xdtft));
axis([0 2 0 8]);
xlabel('omega/pi');
ylabel('|X(omega)|');
title('Magnitude and phase of DTFT of x[n]')

subplot(2,1,2);
plot(w/pi,angle(Xdtft));
xlabel('omega/pi');
ylabel('< X(omega)');

N = 5;
tildex5 = [1 1 1 0 0];

Xdft5 = fft(tildex5, N);
Xdft5.' 

figure
subplot(2,1,1);
plot(w/pi,abs(Xdtft));



k = [0 1 2 3 4];
hold on
stem((k*2*pi/N)/pi,abs(Xdft5))

subplot(2,1,2);
plot(w/pi,angle(Xdtft));

hold on
stem((k*2*pi/N)/pi,angle(Xdft5))

hold off

xlabel('omega/pi or 2*k/N');
ylabel('|X(omega)| or |X(k)|');
title('DTFT of x[n] compared with the N=5 point DFT of x[n]');



N = 10;
tildex10 = [1 1 1 0 0 0 0 0 0 0];

Xdft10 = fft(tildex10, N);
Xdft10.'

figure
subplot(2,1,1);
plot(w/pi,abs(Xdtft));

k = [0 1 2 3 4 5 6 7 8 9];
hold on
stem((k*2*pi/N)/pi,abs(Xdft10))

subplot(2,1,2);
plot(w/pi,angle(Xdtft));

hold on
stem((k*2*pi/N)/pi,angle(Xdft10))

hold off

xlabel('omega/pi or 2*k/N');
ylabel('|X(omega)| or |X(k)|');
title('DTFT of x[n] compared with the N=10 point DFT of x[n]');
