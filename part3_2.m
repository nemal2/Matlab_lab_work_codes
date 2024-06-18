%Q2
T=2;
p = T/3;
t = -2 : 0.001 : 2;
yt = 0;

%forloop
for k=-5:1:5
    yk=(p/T)*sinc(k*p/T);
    yt=yt+yk*exp(1i*k*2*pi*t/T);
end

subplot(3,1,1);
plot(t,real(yt));
grid;
title('Graph of Reconstrcted Wave k -5:5');
xlabel('t');
ylabel('y(t)');
yt=0;

for k=-20:1:20
    yk=(p/T)*sinc(k*p/T);
    yt=yt+yk*exp(1i*k*2*pi*t/T);
end

subplot(3,1,2);
plot(t,real(yt));
grid;
title('Graph of Reconstrcted Wave k -20:20');
xlabel('t');
ylabel('y(t)');
yt=0;

%orig.

k=-2:1:2;
y_o = pulstran(t/p,k*T/p, 'rectpuls');
subplot(3,1,3);
plot(t,y_o);
grid;
title('Original Rectangular wave');
xlabel('t');
ylabel('y(t)');